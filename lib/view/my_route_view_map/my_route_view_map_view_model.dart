import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/model/DTODriverRoute.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/network/network_manager.dart';

part 'my_route_view_map_view_model.g.dart';

class MyRouteViewModelViewModel = _MyRouteViewModelViewModelBase with _$MyRouteViewModelViewModel;

abstract class _MyRouteViewModelViewModelBase with Store {
  @observable
  bool isShowRoute = false;
  @observable
  List<LatLng> points = [];
  @observable
  bool isLoading = true;

  @action
  getRoute(DTOTaskTruckUserRelation task, MapController mapController) async {
    Map<String, int> data = {"RelationId": task.Id!};

    List<DTODriverRoute> response = await NetworkManager.instance!.dioPost("/DriverRoute/GetDriverRouteByRelationId", DTODriverRoute(), data);

    isLoading = false;

    for (DTODriverRoute item in response) {
      points.add(LatLng(item.Lat!, item.Lon!));
    }

    if (points.length > 0) {
      mapController.fitBounds(LatLngBounds(points.first, points.last), options: FitBoundsOptions(padding: EdgeInsets.all(50)));
      isShowRoute = true;
    }
  }
}
