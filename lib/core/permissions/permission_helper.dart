import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nestle_app/core/components/bottom_sheet_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {

  static Future<bool> checkCameraPermission(BuildContext context) async {
    PermissionStatus permissionStatus = await Permission.camera.status;
    if(permissionStatus.isGranted) return true;
    else if(permissionStatus.isPermanentlyDenied){
      openBottomSheetDialog(
          context: context,
          dialogTitle: "Kamera İzni Veriniz",
          dialogMessage: "Fotoğraf İşlemleri Yapmak İçin Ayarlardan Kamera İznini Açınız",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: ()async {
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await openAppSettings();
          });
      return false;
    }else{
      permissionStatus = await Permission.camera.request();
      if(permissionStatus.isGranted) return true;
      else if(permissionStatus.isPermanentlyDenied){
        openBottomSheetDialog(
          context: context,
          dialogTitle: "Kamera İzni Veriniz",
          dialogMessage: "Fotoğraf İşlemleri Yapmak İçin Ayarlardan Kamera İznini Açınız",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: () {
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await openAppSettings();
          });
        return false;
      }else{
        return false; 
      }
    }
  }

  static Future<bool> checkPhotosPermission(BuildContext context) async {
    PermissionStatus permissionStatus = Platform.isIOS ? await Permission.photos.status : await Permission.storage.status;
    if(permissionStatus.isGranted) return true;
    else if(permissionStatus.isPermanentlyDenied){
      openBottomSheetDialog(
          context: context,
          dialogTitle: "Fotoğraflar İzni Veriniz",
          dialogMessage: "Fotoğraf İşlemleri Yapmak İçin Ayarlardan Fotoğraf İznini Açınız",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: ()async {
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await openAppSettings();
          });
      return false;
    }else{
      permissionStatus = Platform.isIOS ? await Permission.photos.request() : await Permission.storage.request();
      if(permissionStatus.isGranted) return true;
      else if(permissionStatus.isPermanentlyDenied){
        openBottomSheetDialog(
          context: context,
          dialogTitle: "Fotoğraflar İzni Veriniz",
          dialogMessage: "Fotoğraf İşlemleri Yapmak İçin Ayarlardan Fotoğraf İznini Açınız",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: ()async {
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await openAppSettings();
          });
        return false;
      }else{
        return false; 
      }
    }
  }

  static Future<bool> checkLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.always) return true;
    else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.always) return true;
      else {
        openBottomSheetDialog(
          context: context,
          dialogTitle: "Konum İzniniz Yetersiz",
          dialogMessage: "Lütfen Uygulama Ayarlarından Konum İznine 'Her Zaman' İzni Veriniz",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: ()async {
            if (await Geolocator.checkPermission() == LocationPermission.always)
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await Geolocator.openAppSettings();
          });
        return false;
      }
    }
    else {
      openBottomSheetDialog(
          context: context,
          dialogTitle: "Konum İzniniz Yetersiz",
          dialogMessage: "Lütfen Uygulama Ayarlarından Konum İznine 'Her Zaman' İzni Veriniz",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: ()async {
            if (await Geolocator.checkPermission() == LocationPermission.always)
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await Geolocator.openAppSettings();
          });
      return false;
    }
  }

  static Future<bool> checkLocationService(BuildContext context) async {
    bool locationServiceStatus = await Geolocator.isLocationServiceEnabled();
    if(locationServiceStatus) return true;
    else {
      openBottomSheetDialog(
          context: context,
          dialogTitle: "Konum Hizmetleriniz Kapalı",
          dialogMessage: "Lütfen Cihazınızın Konum Hizmetlerini Aktif Hale Getirin",
          negativeButtonText: "Reddet",
          barrierDismissible: false,
          negativeButtonOnPress: () async {
            if(await Geolocator.isLocationServiceEnabled())
              Navigator.pop(context);
          },
          positiveButtonText: "Aç",
          positiveButtonOnPress: () async {
            Navigator.pop(context);
            await Geolocator.openLocationSettings();
          });
      return false;
    }
  }

}