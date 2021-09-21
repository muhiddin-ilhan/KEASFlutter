import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:nestle_app/core/gps/BackgroundService.dart';
//import 'package:nestle_app/core/gps/BackgroundServiceIOS.dart';
import 'package:nestle_app/core/helper/danger_areas_database_helper.dart';
import 'package:nestle_app/core/helper/routes_database_helper.dart';
import 'package:nestle_app/core/model/DTOBackground.dart';
import 'package:nestle_app/core/model/DTODangerArea.dart';
import 'package:nestle_app/core/model/DTODriverRoute.dart';
import 'package:nestle_app/core/model/DTOFactoryEntry.dart';
import 'package:nestle_app/core/model/DTOResult.dart';
import 'package:nestle_app/core/network/network_manager.dart';
import 'package:nestle_app/core/preferences/shared_preferences.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:vibration/vibration.dart';

class EService {
  Future<bool> onStartBackgroundService(DTOBackground info) async {
    if (Platform.isAndroid) {
      WidgetsFlutterBinding.ensureInitialized();
      await FlutterBackgroundService.initialize(onStartAndroid);
      await Future.delayed(Duration(milliseconds: 1500), () {
        FlutterBackgroundService().sendData({"action": "setAsForeground"});
        FlutterBackgroundService().sendData({"startBackgroundGps": info});
      });
    } else {
      // await BackgroundServiceIOS().initialize(info.UserId!, info.ShipmentId!, info.TruckId!, info.RelationId!);
      // await BackgroundServiceIOS().start();
    }

    return true;
  }

  Future<bool> onFactoryEntrySendInfo(Map<String, dynamic> info, double distance) async {
    try {
      DTOFactoryEntry factoryEntry = new DTOFactoryEntry(
        TaskId: info["ShipmentId"],
        UserId: info["UserId"],
        TruckId: info["TruckId"],
        RelationId: info["RelationId"],
        RemainingDistance: distance,
      );

      await NetworkManager.instance!.dioPost("/FactoryEntry/InsertFactoryEntry", DTOResult(), factoryEntry).timeout(Duration(seconds: 5));
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> onStopBackgroundService() async {
    if (Platform.isAndroid) {
      //WidgetsFlutterBinding.ensureInitialized();
      await FlutterBackgroundService.initialize(onStartAndroid);
      FlutterBackgroundService().sendData({"action": "stopService"});
    } else {
      //await BackgroundServiceIOS().stop();
    }

    return true;
  }

  Future<bool> sendSavedRouteData() async {
    if (Platform.isAndroid) {
      List<DTODriverRoute> listOldRoute = await RoutesDatabaseHelper.instance.getAllItems().timeout(Duration(seconds: 5));
      try {
        DTOResult? response =
            await NetworkManager.instance!.dioPost("/DriverRoute/InsertDriverRouteBulk", DTOResult(), listOldRoute).timeout(Duration(seconds: 5));
        if (response == null) return false;
        if (response.IsSuccess == null) return false;
        if (!(response.IsSuccess!)) return false;

        await RoutesDatabaseHelper.instance.removeAllItem().timeout(Duration(seconds: 5));
        return true;
      } catch (e) {
        print(e.toString());
        return false;
      }
    } else {
      // String? shipmentInfo = await SharedManager.instance.getStringValue("shipmentInfo");

      // if(shipmentInfo == null || shipmentInfo == "") return true;

      // List<String> infos = shipmentInfo.split("//");

      // int userId = int.parse(infos[0]);
      // int taskId = int.parse(infos[2]);
      // int truckId = int.parse(infos[1]);
      // int relationId = int.parse(infos[3]);

      // await BackgroundServiceIOS().initialize(userId, taskId, truckId, relationId);
      // await BackgroundServiceIOS().syncSavedDate();

      return true;
    }
  }

  Future<bool> onCompleteShipment(int shipmentId) async {
    await onStopBackgroundService();

    if (!(await sendSavedRouteData())) return false;

    await SharedManager.instance.setBoolValue("isBackgroundOpen", false);
    await SharedManager.instance.setIntValue("whichBackgroundTask", 0);
    await SharedManager.instance.setStringValue("shipmentInfo", "");

    if (!(await completeShipmentState(shipmentId))) return false;

    return true;
  }

  Future<bool> completeShipmentState(int shipmentId) async {
    Map<String, dynamic> data = {"Id": shipmentId, "DischargeDate": DateTime.now().toString()};
    try {
      NetworkManager.instance!.setBaseApiUrl();
      NetworkManager.instance!.setHeader();
      DTOResult? response =
          await NetworkManager.instance!.dioPost("/TaskTruckUserRelation/UpdateDischargeDate", DTOResult(), data).timeout(Duration(seconds: 5));
      if (response == null) return false;
      if (response.IsSuccess == null) return false;
      if (!(response.IsSuccess!)) return false;

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<List<dynamic>>> getAllDangerAreas() async {
    await DangerAreasDatabaseHelper.instance.open();
    List<DTODangerArea> dangerAreas = await DangerAreasDatabaseHelper.instance.getAllItems();
    List<List<dynamic>> polygonList = [];
    if (dangerAreas.length > 0) {
      for (DTODangerArea area in dangerAreas) {
        List<dynamic> polygons = jsonDecode(area.Polygon!)["coordinates"][0];
        polygonList.add(polygons);
      }
    }
    return polygonList;
  }

  Future<bool> isInsideDangerAreas(double lat, double lon, List<List<dynamic>> polygonList) async {
    List<LatLng> latLngList = [];
    LatLng myPoint = LatLng(lat, lon);
    for (List<dynamic> polygon in polygonList) {
      latLngList.clear();

      for (List<dynamic> pointsPolygon in polygon) {
        latLngList.add(LatLng(pointsPolygon[1], pointsPolygon[0]));
      }

      if (PolygonUtil.containsLocation(myPoint, latLngList, true)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future dangerAreaAlert() async {
    if (await Vibration.hasVibrator() ?? false) {
      if (await Vibration.hasCustomVibrationsSupport() ?? false) {
        Vibration.vibrate(pattern: [500, 1000, 500, 1000, 500, 1000]);
      } else {
        Vibration.vibrate();
        await Future.delayed(Duration(milliseconds: 500));
        Vibration.vibrate();
        await Future.delayed(Duration(milliseconds: 500));
        Vibration.vibrate();
      }
    }
  }
}
