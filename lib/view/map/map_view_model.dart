import 'dart:async';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingResponse.dart';
import 'package:nestle_app/core/model/DTOFactories.dart';
import 'package:nestle_app/core/network/network_manager.dart';
part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  @observable
  LatLng destinationPoint = LatLng(0.0, 0.0);
  @observable
  LatLng? ownLocation;
  @observable
  String targetDistance = "-";
  @observable
  String arrivalTime = "-";
  @observable
  bool isLockOwnLocation = true;
  @observable
  double ownMarkerAngle = 0.0;
  @observable
  double accuracy = 0.0;
  @observable
  List<LatLng> bmsRoute = [];
  @observable
  AnimationController? controller;

  StreamSubscription<Position>? locationStream;

  @action
  setIsLockOwnLocation() {
    isLockOwnLocation = !isLockOwnLocation;
  }

  @action
  mapProcessesClose() async {
    controller!.stop();
    controller!.dispose();
    if (locationStream != null) locationStream?.cancel();
  }

  @action
  getRouteToDestination(String origin) async {
    String dest;

    if (AppSession.instance!.getIsGorevOrFabrika()!) {
      if (AppSession.instance!.getTask() != null) {
        DTOFactories? factoryInfo = await getDetailInfo();
        if (factoryInfo != null) {
          dest = factoryInfo.Lon.toString() + " " + factoryInfo.Lat.toString();
        } else {
          return;
        }
      } else {
        return;
      }
    } else {
      if (AppSession.instance!.getTask() != null) {
        dest = AppSession.instance!.getTask()!.Task!.GoodsLoadingAreaLon.toString() +
            " " +
            AppSession.instance!.getTask()!.Task!.GoodsLoadingAreaLat.toString();
      } else {
        return;
      }
    }

    AppSession.instance!.setRoutingRequest(origin, dest);

    if (AppSession.instance!.getRoutingRequest() != null) {
      NetworkManager.instance!.setBmsRoutingUrl();
      BMSRoutingResponse response = await NetworkManager.instance!.dioPost<BMSRoutingResponse>(
          "/api/Basar/BasarRouting?apiKey=e59c720692894f0ea9015679f4aa3dbc", BMSRoutingResponse(), AppSession.instance!.getRoutingRequest());

      if (response.data != null) {
        destinationPoint = LatLng(double.parse(dest.split(" ")[1]), double.parse(dest.split(" ")[0]));

        double distance = (response.data![0].properties!.distance! / 1000);
        if (distance < 1) {
          distance = distance * 1000;
          targetDistance = distance.toStringAsFixed(0) + " M";
        } else {
          targetDistance = distance.toStringAsFixed(1) + " Km";
        }

        double timeMinute = (response.data![0].properties!.duration! / 60);
        arrivalTime = timeMinute.toStringAsFixed(0) + " Dk";

        List<LatLng> tmpLatLng = [];
        List<List<double>> routePoints = response.data![0].features![0].geometry!.coordinates!;
        for (List<double> point in routePoints) {
          tmpLatLng.add(LatLng(point[1], point[0]));
        }
        bmsRoute = tmpLatLng;
      }
    }
  }

  @action
  Future getOwnLocation(MapController mapController, TickerProvider vsync) async {
    Tween<double> _latTween, _lngTween, _rotateMapTween, _rotateMarkerTween;
    controller = AnimationController(vsync: vsync, duration: Duration(milliseconds: 500));
    Animation<double> animation = CurvedAnimation(parent: controller!, curve: Curves.linear);
    double oldRotate = 0;
    int count = 0;

    Stream<Position> options = Geolocator.getPositionStream(distanceFilter: 5, intervalDuration: Duration(milliseconds: 1000));

    locationStream = options.listen((Position position) {
      if (ownLocation != null) {
        _latTween = Tween<double>(begin: ownLocation!.latitude, end: position.latitude);
        _lngTween = Tween<double>(begin: ownLocation!.longitude, end: position.longitude);
      } else {
        _latTween = Tween<double>(begin: position.latitude, end: position.latitude);
        _lngTween = Tween<double>(begin: position.longitude, end: position.longitude);
      }

      if (AppSession.instance!.getTask() != null) {
        getRouteToDestination(position.longitude.toString() + " " + position.latitude.toString());
      }

      double rotate = getRotation(position, mapController);
      if (count != 0 || count != 3) {
        _rotateMarkerTween = Tween<double>(begin: oldRotate, end: rotate);
      } else {
        _rotateMarkerTween = Tween<double>(begin: mapController.rotation, end: rotate);
      }

      if (mapController.rotation - rotate > 10 || rotate - mapController.rotation > 10) count++;

      if (count == 0 || count == 3) {
        _rotateMapTween = Tween<double>(begin: mapController.rotation, end: rotate);
        count = 0;
      } else {
        _rotateMapTween = Tween<double>(begin: mapController.rotation, end: mapController.rotation);
      }

      accuracy = position.accuracy;

      AppSession.instance!.setLastKnownLocation(position);

      controller!.addListener(() {
        if (isLockOwnLocation && ownLocation != null) {
          mapController.move(ownLocation!, mapController.zoom == 4 ? 14 : mapController.zoom);
          mapController.rotate(_rotateMapTween.evaluate(animation));
        }
        ownMarkerAngle = _rotateMarkerTween.evaluate(animation);
        ownLocation = LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation));
      });

      controller!.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          oldRotate = rotate;
        }
      });

      controller!.reset();
      controller!.forward();
    });
  }

  double getRotation(Position position, MapController mapController) {
    if (ownLocation != null) {
      double rotate = atan2(position.longitude - ownLocation!.longitude, position.latitude - ownLocation!.latitude) * (-180) / 3.14;

      if (rotate - mapController.rotation > 250) rotate = rotate - 360;
      if (mapController.rotation - rotate > 250) rotate = rotate + 360;

      return rotate;
    } else {
      return 0;
    }
  }

  Future<DTOFactories?> getDetailInfo() async {
    NetworkManager.instance!.setBaseApiUrl();
    NetworkManager.instance!.setHeader();

    try {
      DTOFactories request = await NetworkManager.instance!
          .dioPost("/Factories/GetFactoryById", DTOFactories(), {"Id": AppSession.instance!.getTask()!.Task!.FactoryId});
      return request;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
