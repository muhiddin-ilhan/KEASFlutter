import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/components/bottomNavBar/bottom_nav_bar.dart';
import 'package:nestle_app/core/gps/EService.dart';
import 'package:nestle_app/core/helper/danger_areas_database_helper.dart';
import 'package:nestle_app/core/model/DTODangerArea.dart';
import 'package:nestle_app/core/model/DTOUser.dart';
import 'package:nestle_app/core/network/network_manager.dart';
import 'package:nestle_app/core/preferences/shared_preferences.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/view/authenticate/login/login_view.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  @observable
  String loadingText = "Yükleniyor";

  @action
  isUserLogin(BuildContext ctx) async {
    loadingText = "Kullanıcı Kontrol Ediliyor...";
    await SharedManager.preferencesInit();
    String username = await SharedManager.instance.getStringValue("username") ?? "";
    String password = await SharedManager.instance.getStringValue("password") ?? "";

    if (username != "" && password != "") {
      DTOUser user = new DTOUser(Identity: username, Password: password);

      try {
        user = await NetworkManager.instance!.dioPost("/Authentication/Login", DTOUser(), user);

        if (user.LoginResult == null) {
          await RouteHelper().pushReplacement(ctx, LoginView());
          return;
        }

        if (user.LoginResult!.IsSuccess == null) {
          await RouteHelper().pushReplacement(ctx, LoginView());
          return;
        }

        if (user.LoginResult!.IsSuccess!) {
          AppSession.instance!.setUser(user);
          await RouteHelper().pushReplacement(ctx, BottomNavigationManager());
        } else {
          await RouteHelper().pushReplacement(ctx, LoginView());
        }
      } catch (e) {
        await RouteHelper().pushReplacement(ctx, LoginView());
      }
    } else {
      await RouteHelper().pushReplacement(ctx, LoginView());
    }
  }

  @action
  isThereNotSendingData(BuildContext ctx) async {
    EService eService = new EService();

    loadingText = "Veriler Eşitleniyor...";
    await eService.sendSavedRouteData();

    loadingText = "Tehlikeli Bölgeler İndiriliyor...";
    await downloadDangerAreas();

    loadingText = "İzinler Kontrol Ediliyor...";
    bool isPermissionsOk = false;
    bool isLocationServiceOpen = false;
    while(!isLocationServiceOpen){
      isPermissionsOk = await checkLocationPermission();

      if (isPermissionsOk) {
        isLocationServiceOpen = await Geolocator.isLocationServiceEnabled();
        if(isLocationServiceOpen){
          isUserLogin(ctx);
          return;
        }
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @action
  Future<bool> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.always) return true;
    else return false;
  }


  @action
  Future downloadDangerAreas() async {
    try {
      List<DTODangerArea> dangerAreas = await NetworkManager.instance!.dioPost("/Areas/GetAllDangerAreasGeoJSON", DTODangerArea(), {});
      await DangerAreasDatabaseHelper.instance.open();
      await DangerAreasDatabaseHelper.instance.removeAllItem();
      for (DTODangerArea area in dangerAreas) {
        await addDbDangerAreas(area);
      }
    } catch (e) {
      print(e.toString());
    }

    return;
  }

  @action
  Future addDbDangerAreas(DTODangerArea area) async {
    try {
      await DangerAreasDatabaseHelper.instance.insertItem(area);
      print("Added");
    } catch (e) {
      print(e.toString());
    }
  }
}
