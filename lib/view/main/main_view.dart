import 'dart:io';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/components/bottom_sheet_dialog.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/core/viewmodel/global_view_model.dart';
import 'package:nestle_app/view/detail/detail_view.dart';
import 'package:nestle_app/view/main/main_view_model.dart';
import 'package:nestle_app/view/profile/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends BaseState<MainView> {
  MainViewModel viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<MainViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: MainViewModel(),
      onDispose: () {},
      onPageBuilder: (ctx, value) {
        viewModel.isBackgroundTaskOpened();
        viewModel.getIncompletedShipments(context);
        return scaffold;
      },
    );
  }

  Widget get scaffold => LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Container(
          height: dynamicHeight(1),
          width: dynamicWidth(1),
          color: Color(0x35ffffff),
          child: Center(
            child: SizedBox(
              height: dynamicWidth(0.3),
              width: dynamicWidth(0.3),
              child: Lottie.asset("asset/anim/truck_anim.json",
                  frameRate: FrameRate(60)),
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(230, 230, 230, 1),
          appBar: appBar,
          body: Observer(
            builder: (context) {
              return !viewModel.isLoading
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          vertical: dynamicHeight(0.01),
                          horizontal: dynamicWidth(0.015)),
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: viewModel.allTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50,
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: customShipmentCard(
                                        id: viewModel.allTasks[index].Id!,
                                        title: viewModel
                                            .allTasks[index].Task!.TaskTitle!,
                                        description: viewModel
                                                .allTasks[index].Truck!.Brand! +
                                            ", " +
                                            viewModel
                                                .allTasks[index].Truck!.Model! +
                                            "  (" +
                                            viewModel.allTasks[index].Truck!
                                                .Plaque! +
                                            ")",
                                        taskDate: viewModel
                                            .allTasks[index].EntryDate!,
                                        task: viewModel.allTasks[index]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : listLoadingAnim();
            },
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Text(AppLocalizations.getString("home_page_title")),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await RouteHelper().push(context, ProfileView());
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () async {
              viewModel.getIncompletedShipments(context);
            },
            icon: Icon(Icons.replay),
          )
        ],
        leading: Platform.isAndroid
            ? IconButton(
                onPressed: () async {
                  viewModel.onStop(context);
                },
                icon: Icon(Icons.close),
              )
            : null,
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

  Widget customShipmentCard(
      {required int id,
      required String title,
      required String description,
      required DateTime taskDate,
      required DTOTaskTruckUserRelation task}) {
    return Observer(
      builder: (context) => Card(
        elevation: 2,
        borderOnForeground: true,
        shape: Border.all(
            color: viewModel.whichTaskOpened == task.Id
                ? Colors.grey
                : Colors.white,
            width: 2),
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(right: dynamicWidth(0.04)),
          title: Container(
            padding: EdgeInsets.symmetric(
                horizontal: dynamicWidth(0.04), vertical: dynamicHeight(0.009)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: dynamicWidth(0.08),
                      width: dynamicWidth(0.08),
                      margin: EdgeInsets.only(right: dynamicWidth(0.04)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            dynamicWidth(0.04),
                          ),
                        ),
                        border:
                            Border.all(color: Colors.blue.shade700, width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          id.toString(),
                          style:
                              TextStyle(color: Colors.blue[800], fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              title,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: dynamicHeight(0.01),
                          ),
                          Container(
                            child: Text(
                              description,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(0, 0, 0, 0.5)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: dynamicHeight(0.015),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Görev Tarihi : "),
                              Spacer(),
                              Text(
                                DateFormat("dd/MM/yyyy kk:mm").format(taskDate),
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.6)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(240, 240, 240, 1),
                            ),
                            elevation: MaterialStateProperty.all(1),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            RouteHelper().push(
                              context,
                              DetailView(
                                task: task,
                              ),
                            );
                          },
                          child: Text("Detay"),
                        ),
                      ),
                      SizedBox(
                        width: dynamicWidth(0.01),
                      ),
                      Expanded(
                        flex: 3,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(240, 240, 240, 1),
                            ),
                            elevation: MaterialStateProperty.all(1),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            onDrawRouteAlertDialog(task);
                          },
                          child: Text("Rota Oluştur"),
                        ),
                      ),
                      SizedBox(
                        width: dynamicWidth(0.01),
                      ),
                      viewModel.isBackgroundTaskOpen!
                          ? viewModel.whichTaskOpened == task.Id
                              ? Expanded(
                                  flex: 4,
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color.fromRGBO(240, 240, 240, 1),
                                      ),
                                      elevation: MaterialStateProperty.all(1),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                          horizontal: dynamicWidth(0.06),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      onStopShipment();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.pause),
                                        Text("Durdur")
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox()
                          : Expanded(
                              flex: 4,
                              child: OutlinedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(240, 240, 240, 1),
                                  ),
                                  elevation: MaterialStateProperty.all(1),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                      horizontal: dynamicWidth(0.06),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  onStartTask(task);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.play_arrow),
                                    Text("Başlat")
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listLoadingAnim() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Lottie.asset(
            "asset/anim/card_loading_anim.json",
            frameRate: FrameRate(60),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(
            "asset/anim/truck_anim.json",
            frameRate: FrameRate(60),
          ),
        ),
      ],
    );
  }

  onStartTask(DTOTaskTruckUserRelation task) async {
    AppSession.instance!.setTask(task);
    context.loaderOverlay.show();
    await viewModel.onStart(context, task);
    context.loaderOverlay.hide();
  }

  onStopShipment() async {
    await viewModel.onStop(context);
  }

  onDrawRouteAlertDialog(DTOTaskTruckUserRelation task) {
    openBottomSheetDialog(
        context: context,
        dialogTitle: "Rota Oluştur",
        dialogMessage: "Nereye Rota Oluşturmak İstiyorsunuz",
        negativeButtonText: "Göreve",
        negativeButtonOnPress: () {
          RouteHelper().pop(context);
          onDrawRouteGorev(task);
        },
        positiveButtonText: "Fabrikaya",
        positiveButtonOnPress: () {
          RouteHelper().pop(context);
          onDrawRouteFabrika(task);
        },
        negativeButtonIcon: Icons.landscape,
        positiveButtonIcon: Icons.location_city,
        barrierDismissible: true);
  }

  onDrawRouteGorev(DTOTaskTruckUserRelation task) async {
    AppSession.instance!.setTask(task);
    AppSession.instance!.setIsGorevOrFabrika(false);
    final FancyBottomNavigationState fState =
        globalViewModelInstance?.getBottomNavigationKey.currentState;
    fState.setPage(1);
  }

  onDrawRouteFabrika(DTOTaskTruckUserRelation task) async {
    AppSession.instance!.setTask(task);
    AppSession.instance!.setIsGorevOrFabrika(true);
    final FancyBottomNavigationState fState =
        globalViewModelInstance?.getBottomNavigationKey.currentState;
    fState.setPage(1);
  }
}
