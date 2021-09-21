import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/components/bottomNavBar/bottom_nav_bar.dart';
import 'package:nestle_app/core/components/bottom_sheet_dialog.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/gps/EService.dart';
import 'package:nestle_app/core/model/DTOFactories.dart';
import 'package:nestle_app/core/model/DTOResult.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/network/network_manager.dart';
import 'package:nestle_app/core/preferences/shared_preferences.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:permission_handler/permission_handler.dart';
part 'detail_view_model.g.dart';

class DetailViewModel = _DetailViewModelBase with _$DetailViewModel;

abstract class _DetailViewModelBase with Store {
  @observable
  bool isLoading = false;
  @observable
  DTOFactories? factoryInfo;
  @observable
  ImagePicker picker = ImagePicker();

  @action
  getDetailInfo(DTOTaskTruckUserRelation task) async {
    NetworkManager.instance!.setBaseApiUrl();
    NetworkManager.instance!.setHeader();

    print(factoryInfo);
    try {
      DTOFactories request = await NetworkManager.instance!.dioPost("/Factories/GetFactoryById", DTOFactories(), {"Id": task.Task!.FactoryId});
      factoryInfo = request;
    } catch (e) {
      print(e.toString());
    }
  }

  @action
  onCompleteTask(BuildContext ctx, int taskId) async {
    EService eService = new EService();

    bool result = await eService.onCompleteShipment(taskId);

    if (result) {
      SharedManager.instance.setBoolValue("isBackgroundOpen", false);
      SharedManager.instance.setIntValue("whichBackgroundTask", 0);

      RouteHelper().puhsAndCloseOther(ctx, BottomNavigationManager());
    } else {
      showSnackBar(ctx, "Bir Hata Oluştu!");
    }
  }

  @action
  Future<void> openSelectPhotoDialog(BuildContext context, DTOTaskTruckUserRelation task) async {
    PermissionStatus permissionStatus = await Permission.storage.status;
    if (permissionStatus.isGranted) {
      openBottomSheetDialog(
        context: context,
        dialogTitle: "Seçim Yapın",
        dialogMessage: "Fotoğraf Yükleme Seçimini Yapınız",
        negativeButtonText: "Galeriden Seç",
        negativeButtonIcon: Icons.photo,
        negativeButtonOnPress: () {
          photoSelectButton(ImageSource.gallery, task, context);
          RouteHelper().pop(context);
        },
        positiveButtonText: "Kamera Aç",
        positiveButtonIcon: Icons.camera,
        positiveButtonOnPress: () {
          photoSelectButton(ImageSource.camera, task, context);
          RouteHelper().pop(context);
        },
      );
    }else{
      await Permission.storage.request();
    }
  }

  void photoSelectButton(ImageSource source, DTOTaskTruckUserRelation task, BuildContext ctx) async {
    try {
      await getImage(source, task, ctx);
    } catch (e) {
      print(e);
    }
  }

  Future getImage(ImageSource source, DTOTaskTruckUserRelation task, BuildContext ctx) async {
    final pickedFile = await picker.getImage(source: source);
    final bytes = File(pickedFile!.path).readAsBytesSync();
    String base64Photo = base64Encode(bytes);
    if (await insertImage(base64Photo, task)) {
      showSnackBar(ctx, "Fotoğraf Yüklendi");
    }else{
      showSnackBar(ctx, "Fotoğraf Yüklenirken Bir Hata Oluştu");
    }
  }

  Future<bool> insertImage(String base64Photo, DTOTaskTruckUserRelation task) async {
    Map<String, dynamic> data = {
      "Id": task.Id,
      "Photo": {"Base64Data": base64Photo}
    };

    NetworkManager.instance!.setBaseApiUrl();
    NetworkManager.instance!.setHeader();
    DTOResult? response = await NetworkManager.instance!.dioPost("/TaskTruckUserRelation/InsertPhoto", DTOResult(), data);

    if (response != null) {
      if (response.IsSuccess!) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
