import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/components/map_components/heading_sector.dart';
import 'package:nestle_app/core/components/map_components/user_marker.dart';
import 'package:nestle_app/core/constants/base_settings.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/viewmodel/global_view_model.dart';
import 'package:nestle_app/view/map/map_view_model.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends BaseState<MapView> with SingleTickerProviderStateMixin {
  MapViewModel viewModel = MapViewModel();
  MapController _mapController = MapController();
  double ownMarkerSize = 42;

  @override
  void dispose() async {
    viewModel.mapProcessesClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<MapViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: MapViewModel(),
      onDispose: () {},
      onPageBuilder: (context, value) {
        viewModel.getOwnLocation(_mapController, this);
        return scaffold;
      },
    );
  }

  Widget get scaffold => Scaffold(
        appBar: appBar,
        body: Container(
          child: Stack(
            children: [
              Center(
                child: Observer(
                  builder: (context) => FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: LatLng(41, 34.8135),
                      zoom: 4,
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
                            points: viewModel.bmsRoute,
                          ),
                        ],
                      ),
                      CircleLayerOptions(
                        circles: [
                          viewModel.ownLocation != null
                              ? CircleMarker(
                                  point: viewModel.ownLocation!,
                                  radius: viewModel.accuracy,
                                  useRadiusInMeter: true,
                                  color: Color.fromARGB(0x18, 0x21, 0x96, 0xF3),
                                )
                              : CircleMarker(point: LatLng(0, 0), radius: 0),
                        ],
                      ),
                      MarkerLayerOptions(
                        markers: [
                          viewModel.ownLocation != null
                              ? Marker(point: viewModel.ownLocation!, height: 20, width: 20, builder: (ctx) => UserMarker())
                              : Marker(point: LatLng(0, 0), builder: (ctx) => Container()),
                          viewModel.ownLocation != null
                              ? Marker(
                                  point: viewModel.ownLocation!,
                                  height: 120,
                                  width: 120,
                                  builder: (_) {
                                    return IgnorePointer(
                                        ignoring: true,
                                        child: Transform.rotate(
                                          angle: viewModel.ownMarkerAngle * 3.14 / (-180),
                                          child: CustomPaint(
                                            size: Size.fromRadius(60),
                                            painter: HeadingSector(Color.fromARGB(0xCC, 0x21, 0x96, 0xF3)),
                                          ),
                                        ));
                                  },
                                )
                              : Marker(point: LatLng(0, 0), builder: (ctx) => Container()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              mapInfoBoxes,
              myLocationButton,
              zoomInOutButton,
            ],
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Text("Harita"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            final FancyBottomNavigationState fState = globalViewModelInstance?.getBottomNavigationKey.currentState;
            fState.setPage(0);
          },
        ),
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

  Widget get mapInfoBoxes => Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: dynamicHeight(0.015), left: dynamicWidth(0.03)),
          child: Observer(
            builder: (context) => Column(
              children: [
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.all(Radius.circular(dynamicWidth(0.1))),
                  child: Container(
                    width: dynamicWidth(0.3),
                    height: dynamicHeight(0.04),
                    padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.04)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(dynamicWidth(0.1))),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue.shade500, Colors.blue.shade700],
                      ),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.flag,
                              color: Colors.white,
                            ),
                            Text(
                              viewModel.targetDistance,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(0.005),
                ),
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.all(Radius.circular(dynamicWidth(0.1))),
                  child: Container(
                    width: dynamicWidth(0.3),
                    height: dynamicHeight(0.04),
                    padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.04)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(dynamicWidth(0.1))),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue.shade500, Colors.blue.shade700],
                      ),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.hourglass_bottom,
                              color: Colors.white,
                            ),
                            Text(
                              viewModel.arrivalTime,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget get myLocationButton => Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(right: dynamicWidth(0.03), bottom: dynamicHeight(0.015)),
          child: Observer(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                if (!viewModel.isLockOwnLocation) {
                  if (viewModel.ownLocation != null) {
                    _mapController.move(viewModel.ownLocation!, _mapController.zoom);
                  }
                }
                viewModel.setIsLockOwnLocation();
              },
              child: viewModel.isLockOwnLocation ? Icon(Icons.gps_fixed) : Icon(Icons.location_disabled),
              backgroundColor: Colors.blue.shade600,
            ),
          ),
        ),
      );

  Widget get zoomInOutButton => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: dynamicWidth(0.03), bottom: dynamicHeight(0.015)),
          child: Material(
            elevation: 7,
            borderRadius: BorderRadius.all(Radius.circular(dynamicWidth(0.1))),
            child: Container(
              width: dynamicWidth(0.1),
              height: dynamicHeight(0.125),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(dynamicWidth(0.1))),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade500, Colors.blue.shade700],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _mapController.move(_mapController.center, _mapController.zoom + 1);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        _mapController.move(_mapController.center, _mapController.zoom - 1);
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
