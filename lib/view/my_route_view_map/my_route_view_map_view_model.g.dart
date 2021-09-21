// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_route_view_map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyRouteViewModelViewModel on _MyRouteViewModelViewModelBase, Store {
  final _$isShowRouteAtom =
      Atom(name: '_MyRouteViewModelViewModelBase.isShowRoute');

  @override
  bool get isShowRoute {
    _$isShowRouteAtom.reportRead();
    return super.isShowRoute;
  }

  @override
  set isShowRoute(bool value) {
    _$isShowRouteAtom.reportWrite(value, super.isShowRoute, () {
      super.isShowRoute = value;
    });
  }

  final _$pointsAtom = Atom(name: '_MyRouteViewModelViewModelBase.points');

  @override
  List<LatLng> get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(List<LatLng> value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_MyRouteViewModelViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getRouteAsyncAction =
      AsyncAction('_MyRouteViewModelViewModelBase.getRoute');

  @override
  Future getRoute(DTOTaskTruckUserRelation task, MapController mapController) {
    return _$getRouteAsyncAction.run(() => super.getRoute(task, mapController));
  }

  @override
  String toString() {
    return '''
isShowRoute: ${isShowRoute},
points: ${points},
isLoading: ${isLoading}
    ''';
  }
}
