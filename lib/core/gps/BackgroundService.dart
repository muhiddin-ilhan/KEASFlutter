import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nestle_app/core/gps/EService.dart';
import 'package:nestle_app/core/helper/routes_database_helper.dart';
import 'package:nestle_app/core/model/DTODriverRoute.dart';

void onStartAndroid() async {
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();

  service.onDataReceived.listen((event) async {
    if (event!["action"] == "setAsForeground") {
      service.setForegroundMode(true);
      print("BACKGROUND_SERVICE (STARTED)");
      return;
    }

    if (event["action"] == "stopService") {
      service.stopBackgroundService();
      print("BACKGROUND_SERVICE (STOPPED)");
    }

    if (event.containsKey("startBackgroundGps")) {
      service.setAutoStartOnBootMode(false);
      await RoutesDatabaseHelper.instance.open();
      Map<String, dynamic> info = event["startBackgroundGps"];
      EService eService = new EService();
      List<double> coord = [0.0, 0.0];
      int count = 5;
      int isInsideDangerArea = 0;
      int dangerAreaCount = 0;

      List<List> polygonList = await eService.getAllDangerAreas();

      // ignore: cancel_subscriptions
      StreamSubscription<Position> positionStreaam =
          Geolocator.getPositionStream(intervalDuration: Duration(seconds: 3)).listen((Position position) async {
        double lat = position.latitude;
        double lon = position.longitude;
        double spd = position.speed * 18 / 5;

        if (isInsideDangerArea == 0) {
          service.setNotificationInfo(
            title: "Konum Bilgisi",
            content: "Konumunuzu Almaya Devam Ediyor ...",
          );
        }

        double distanceToFactory =
            Geolocator.distanceBetween(position.latitude, position.longitude, info["FactoryCoord"][0], info["FactoryCoord"][1]);
        double distance = Geolocator.distanceBetween(coord[0], coord[1], position.latitude, position.longitude);

        print("LAT : " + lat.toString() + " LON : " + lon.toString() + " SPD : " + spd.toStringAsFixed(3));

        if (await eService.isInsideDangerAreas(position.latitude, position.longitude, polygonList)) {
          service.setNotificationInfo(
            title: "Konum Bilgisi",
            content: "YASAKLANMIŞ BÖLGEDESİNİZ! DERHAL TERKEDİNİZ!",
          );
          isInsideDangerArea = 1;
          if (dangerAreaCount > 10) {
            await eService.dangerAreaAlert();
            dangerAreaCount = 0;
          }
          dangerAreaCount++;
        } else {
          isInsideDangerArea = 0;
        }

        if (distance > -1) {
          if (distanceToFactory < 30000) {
            await eService.onFactoryEntrySendInfo(info, distanceToFactory);
          }

          count++;
          if (count > 3) {
            await eService.sendSavedRouteData();
            count = 0;
          }
          try {
            await RoutesDatabaseHelper.instance
                .insertItem(
                  DTODriverRoute(
                    UserId: info["UserId"],
                    TaskId: info["ShipmentId"],
                    TruckId: info["TruckId"],
                    RelationId: info["RelationId"],
                    Lat: lat,
                    Lon: lon,
                    Speed: spd,
                    IsBreakArea: 0,
                    IsDangerArea: isInsideDangerArea,
                    IsDeleted: 0,
                    RecordDate: DateTime.now(),
                  ),
                )
                .timeout(Duration(seconds: 4));
          } catch (e) {
            print(e.toString());
          }

          coord = [position.latitude, position.longitude];
        }
      });

      positionStreaam.onError((e) async {
        print(e.toString());
      });

      positionStreaam.onDone(() async {
        print("Stream Kapandı");
        positionStreaam.resume();
        service.setNotificationInfo(
          title: "Konum Bilgisi",
          content: "Konumuzu Alamıyoruz ...",
        );
      });

      Timer.periodic(Duration(seconds: 5), (timer) async {
        if(!(await service.isServiceRunning())){
          positionStreaam.cancel();
        }
        if (positionStreaam.isPaused) {
          positionStreaam.resume();
        }
      });
    }
  });
}

// void onStartIOS(bool isStarting) async {
//   if (isStarting) {
//     bg.BackgroundGeolocation.requestPermission();
//     await RoutesDatabaseHelper.instance.open();

//     bg.BackgroundGeolocation.onLocation((bg.Location location) async {
//       print("BACKGROUND_SERVICE (TRIGGERED)");

//       await RoutesDatabaseHelper.instance.insertItem(DbRouteModel(
//           shipment_id: 13, point_lat: location.coords.latitude.toString(), point_lng: location.coords.longitude.toString(), created_time: DateTime.now()));
//     });

//     bg.BackgroundGeolocation.ready(bg.Config(
//             desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
//             distanceFilter: 10,
//             stopOnTerminate: false,
//             startOnBoot: true,
//             debug: true,
//             showsBackgroundLocationIndicator: true,
//             stopAfterElapsedMinutes: 200,
//             logLevel: bg.Config.LOG_LEVEL_VERBOSE))
//         .then((bg.State state) async {
//       if (!state.enabled) {
//         await bg.BackgroundGeolocation.start();
//         print("BACKGROUND_SERVICE (STARTED)");
//       }
//     });
//   } else {
//     await RoutesDatabaseHelper.instance.closeDb();
//     bg.BackgroundGeolocation.stop();
//     print("BACKGROUND_SERVICE (STOPED)");
//   }
// }
