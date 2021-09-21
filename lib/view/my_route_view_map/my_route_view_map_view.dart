import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/constants/base_settings.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/view/my_route_view_map/my_route_view_map_view_model.dart';

class MyRouteViewMapView extends StatefulWidget {
  final DTOTaskTruckUserRelation task;

  const MyRouteViewMapView({Key? key, required this.task}) : super(key: key);

  @override
  _MyRouteViewMapViewState createState() => _MyRouteViewMapViewState();
}

class _MyRouteViewMapViewState extends BaseState<MyRouteViewMapView> {
  MyRouteViewModelViewModel viewModel = MyRouteViewModelViewModel();
  MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BaseView<MyRouteViewModelViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: MyRouteViewModelViewModel(),
      onDispose: () {},
      onPageBuilder: (context, value) {
        viewModel.getRoute(widget.task, _mapController);
        return scaffold;
      },
    );
  }

  Widget get scaffold => Scaffold(
        appBar: appBar,
        body: Observer(
          builder: (context) => Stack(
            children: [
              Container(
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: LatLng(39.889, 32.8135),
                    zoom: 14,
                    plugins: [
                      TappablePolylineMapPlugin(),
                    ],
                  ),
                  layers: [
                    TileLayerOptions(maxZoom: 25, urlTemplate: BaseSettings.GOOGLE_TILE_STREET),
                    TappablePolylineLayerOptions(
                      // Will only render visible polylines, increasing performance
                      polylineCulling: true,
                      polylines: [
                        TaggedPolyline(
                          tag: "BmsRoute",
                          color: Colors.blue,
                          strokeWidth: 7.0,
                          borderColor: Colors.blue[900],
                          borderStrokeWidth: 3.0,
                          isDotted: true,
                          points: viewModel.isShowRoute ? viewModel.points : <LatLng>[],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              viewModel.isLoading
                  ? Container(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      child: Center(
                        child: Lottie.asset(
                          "asset/anim/circles_anim.json",
                          frameRate: FrameRate(60),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Text("Kaydedilen Rotalar"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade600, Colors.blue.shade800],
            ),
          ),
        ),
      );
}
