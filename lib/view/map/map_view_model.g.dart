// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapViewModel on _MapViewModelBase, Store {
  final _$destinationPointAtom =
      Atom(name: '_MapViewModelBase.destinationPoint');

  @override
  LatLng get destinationPoint {
    _$destinationPointAtom.reportRead();
    return super.destinationPoint;
  }

  @override
  set destinationPoint(LatLng value) {
    _$destinationPointAtom.reportWrite(value, super.destinationPoint, () {
      super.destinationPoint = value;
    });
  }

  final _$ownLocationAtom = Atom(name: '_MapViewModelBase.ownLocation');

  @override
  LatLng? get ownLocation {
    _$ownLocationAtom.reportRead();
    return super.ownLocation;
  }

  @override
  set ownLocation(LatLng? value) {
    _$ownLocationAtom.reportWrite(value, super.ownLocation, () {
      super.ownLocation = value;
    });
  }

  final _$targetDistanceAtom = Atom(name: '_MapViewModelBase.targetDistance');

  @override
  String get targetDistance {
    _$targetDistanceAtom.reportRead();
    return super.targetDistance;
  }

  @override
  set targetDistance(String value) {
    _$targetDistanceAtom.reportWrite(value, super.targetDistance, () {
      super.targetDistance = value;
    });
  }

  final _$arrivalTimeAtom = Atom(name: '_MapViewModelBase.arrivalTime');

  @override
  String get arrivalTime {
    _$arrivalTimeAtom.reportRead();
    return super.arrivalTime;
  }

  @override
  set arrivalTime(String value) {
    _$arrivalTimeAtom.reportWrite(value, super.arrivalTime, () {
      super.arrivalTime = value;
    });
  }

  final _$isLockOwnLocationAtom =
      Atom(name: '_MapViewModelBase.isLockOwnLocation');

  @override
  bool get isLockOwnLocation {
    _$isLockOwnLocationAtom.reportRead();
    return super.isLockOwnLocation;
  }

  @override
  set isLockOwnLocation(bool value) {
    _$isLockOwnLocationAtom.reportWrite(value, super.isLockOwnLocation, () {
      super.isLockOwnLocation = value;
    });
  }

  final _$ownMarkerAngleAtom = Atom(name: '_MapViewModelBase.ownMarkerAngle');

  @override
  double get ownMarkerAngle {
    _$ownMarkerAngleAtom.reportRead();
    return super.ownMarkerAngle;
  }

  @override
  set ownMarkerAngle(double value) {
    _$ownMarkerAngleAtom.reportWrite(value, super.ownMarkerAngle, () {
      super.ownMarkerAngle = value;
    });
  }

  final _$accuracyAtom = Atom(name: '_MapViewModelBase.accuracy');

  @override
  double get accuracy {
    _$accuracyAtom.reportRead();
    return super.accuracy;
  }

  @override
  set accuracy(double value) {
    _$accuracyAtom.reportWrite(value, super.accuracy, () {
      super.accuracy = value;
    });
  }

  final _$bmsRouteAtom = Atom(name: '_MapViewModelBase.bmsRoute');

  @override
  List<LatLng> get bmsRoute {
    _$bmsRouteAtom.reportRead();
    return super.bmsRoute;
  }

  @override
  set bmsRoute(List<LatLng> value) {
    _$bmsRouteAtom.reportWrite(value, super.bmsRoute, () {
      super.bmsRoute = value;
    });
  }

  final _$controllerAtom = Atom(name: '_MapViewModelBase.controller');

  @override
  AnimationController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(AnimationController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$mapProcessesCloseAsyncAction =
      AsyncAction('_MapViewModelBase.mapProcessesClose');

  @override
  Future mapProcessesClose() {
    return _$mapProcessesCloseAsyncAction.run(() => super.mapProcessesClose());
  }

  final _$getRouteToDestinationAsyncAction =
      AsyncAction('_MapViewModelBase.getRouteToDestination');

  @override
  Future getRouteToDestination(String origin) {
    return _$getRouteToDestinationAsyncAction
        .run(() => super.getRouteToDestination(origin));
  }

  final _$getOwnLocationAsyncAction =
      AsyncAction('_MapViewModelBase.getOwnLocation');

  @override
  Future<dynamic> getOwnLocation(
      MapController mapController, TickerProvider vsync) {
    return _$getOwnLocationAsyncAction
        .run(() => super.getOwnLocation(mapController, vsync));
  }

  final _$_MapViewModelBaseActionController =
      ActionController(name: '_MapViewModelBase');

  @override
  dynamic setIsLockOwnLocation() {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.setIsLockOwnLocation');
    try {
      return super.setIsLockOwnLocation();
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
destinationPoint: ${destinationPoint},
ownLocation: ${ownLocation},
targetDistance: ${targetDistance},
arrivalTime: ${arrivalTime},
isLockOwnLocation: ${isLockOwnLocation},
ownMarkerAngle: ${ownMarkerAngle},
accuracy: ${accuracy},
bmsRoute: ${bmsRoute},
controller: ${controller}
    ''';
  }
}
