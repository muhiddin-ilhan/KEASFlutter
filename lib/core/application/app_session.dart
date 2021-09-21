import 'package:geolocator/geolocator.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingRequest.dart';
import 'package:nestle_app/core/model/BMSRoute/BMSRoutingRequestOption.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/model/DTOUser.dart';

class AppSession {
  static AppSession? _instance;

  static AppSession? get instance {
    if (_instance == null) {
      _instance = AppSession();
    }

    return _instance;
  }

  Position? _lastKnownLocation;

  DTOTaskTruckUserRelation? _task;

  DTOUser? _user;

  BMSRoutingRequest? _routingRequest;

  bool _isBackgroundTaskOpen = false;

  int _whichTaskOpened = 0;

  bool? _isGorevOrFabrika;

  void setIsGorevOrFabrika(bool value) {
    this._isGorevOrFabrika = value;
  }

  bool? getIsGorevOrFabrika() {
    return this._isGorevOrFabrika;
  }

  void setWhichTaskOpened(int value) {
    this._whichTaskOpened = value;
  }

  int? getWhichTaskOpened() {
    return this._whichTaskOpened;
  }

  void setIsBackgroundTaskOpen(bool value) {
    this._isBackgroundTaskOpen = value;
  }

  bool? getIsBackgroundTaskOpen() {
    return this._isBackgroundTaskOpen;
  }

  void setTask(DTOTaskTruckUserRelation task) {
    this._task = task;
  }

  DTOTaskTruckUserRelation? getTask() {
    return this._task;
  }

  void setUser(DTOUser user) {
    this._user = user;
  }

  DTOUser? getUser() {
    return this._user;
  }

  void setLastKnownLocation(Position location) {
    this._lastKnownLocation = location;
  }

  Position? getLastKnownLocation() {
    return this._lastKnownLocation;
  }

  void setRoutingRequest(String origin, String destination) {
    BMSRoutingRequest data = new BMSRoutingRequest(
      origin: origin,
      destination: destination,
      wayPoints: "",
      addRestDuration: true,
      restDuration: 45,
      requestOptions: BMSRoutingRequestOption(
          liveTraffic: false,
          alternativeRoute: false,
          alternativeCount: 0,
          snapMaxDistance: 5000,
          costType: 1,
          isCar: true,
          isTruck: false,
          isPedestrian: false,
          avoidToolRoad: false,
          avoidHighway: false,
          useFerry: false,
          avoidPrivateRoad: false,
          avoidRestrictedRoad: false,
          useBoat: false,
          isBus: false,
          getManifest: false),
    );

    this._routingRequest = data;
  }

  Map<String, dynamic>? getRoutingRequest() {
    if (this._routingRequest != null)
      return this._routingRequest!.toJson();
    else
      return null;
  }
}
