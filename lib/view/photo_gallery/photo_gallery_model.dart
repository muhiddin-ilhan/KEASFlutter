import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/model/DTOPhoto.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/network/network_manager.dart';
import 'package:permission_handler/permission_handler.dart';
part 'photo_gallery_model.g.dart';

class PhotoGalleryModel = _PhotoGalleryModelBase with _$PhotoGalleryModel;

abstract class _PhotoGalleryModelBase with Store {
  @observable
  bool isLoading = true;
  @observable
  List<DTOPhoto> photos = [];

  @action
  getPhotos(DTOTaskTruckUserRelation task) async {
    NetworkManager.instance!.setBaseApiUrl();
    NetworkManager.instance!.setHeader();

    try {
      List<DTOTaskTruckUserRelation> response =
          await NetworkManager.instance!.dioPost("/TaskTruckUserRelation/GetPhoto", DTOTaskTruckUserRelation(), {"Id": task.Id});
      List<DTOPhoto> tempPhotos = [];
      for (DTOTaskTruckUserRelation item in response) {
        tempPhotos.add(item.Photo!);
      }
      print(tempPhotos);
      photos = tempPhotos;
      isLoading = false;
    } catch (e) {
      print(e.toString());
      isLoading = false;
    }
  }

  @action
  Future<bool> downloadPhoto(DTOPhoto photo, BuildContext context) async {
    try {
      PermissionStatus permissionStatus = await Permission.storage.status;
      if (permissionStatus.isGranted) {
        if(Platform.isAndroid){
          var response = await Dio().get(photo.Path!, options: Options(responseType: ResponseType.bytes));
          String? path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
          String fullPath = "$path/${photo.Id}.jpg";
          File fileFullPath = File(fullPath);
          var raf = fileFullPath.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
        }else{
          var imageId = await ImageDownloader.downloadImage(photo.Path!);
          if (imageId == null) {
            return false;
          }
        }
        showSnackBar(context, "Galeriye Kaydedildi!");
      } else {
        await Permission.storage.request();
      }

      return true;
    } catch (e) {
      print(e);
      showSnackBar(context, "Galeriye Kaydedilirken Hata Oluştu!");
      return false;
    }
  }
}
