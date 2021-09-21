import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/core/viewmodel/global_view_model.dart';
import 'package:nestle_app/view/completed_shipments/completed_shipments_view_model.dart';
import 'package:nestle_app/view/detail/detail_view.dart';
import 'package:nestle_app/view/my_route_view_map/my_route_view_map_view.dart';
import 'package:nestle_app/view/profile/profile_view.dart';

class CompletedShipmentsView extends StatefulWidget {
  const CompletedShipmentsView({Key? key}) : super(key: key);

  @override
  _CompletedShipmentsViewState createState() => _CompletedShipmentsViewState();
}

class _CompletedShipmentsViewState extends BaseState<CompletedShipmentsView> {
  CompletedShipmentsViewModel viewModel = CompletedShipmentsViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<CompletedShipmentsViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: CompletedShipmentsViewModel(),
      onDispose: () {},
      onPageBuilder: (ctx, value) {
        viewModel.getCompletedShipments(context);
        return scaffold;
      },
    );
  }

  Widget get scaffold => Scaffold(
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
                        itemCount: viewModel.allCompletedTask.length,
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
                                      id: viewModel.allCompletedTask[index].Id!,
                                      title: viewModel.allCompletedTask[index]
                                          .Task!.TaskTitle!,
                                      description: viewModel
                                              .allCompletedTask[index]
                                              .Truck!
                                              .Brand! +
                                          ", " +
                                          viewModel.allCompletedTask[index]
                                              .Truck!.Model! +
                                          "  (" +
                                          viewModel.allCompletedTask[index]
                                              .Truck!.Plaque! +
                                          ")",
                                      taskDate: viewModel
                                          .allCompletedTask[index].EntryDate!,
                                      completeDate: viewModel
                                          .allCompletedTask[index]
                                          .DischargeDate!,
                                      task: viewModel.allCompletedTask[index]),
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
      );

  AppBar get appBar => AppBar(
        title: Text("Tamamlananlar"),
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
              viewModel.getCompletedShipments(context);
            },
            icon: Icon(Icons.replay),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            final FancyBottomNavigationState fState =
                globalViewModelInstance?.getBottomNavigationKey.currentState;
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

  Widget customShipmentCard(
      {required int id,
      required String title,
      required String description,
      required DateTime taskDate,
      required DateTime completeDate,
      required DTOTaskTruckUserRelation task}) {
    return Card(
      elevation: 2,
      borderOnForeground: true,
      shape: Border.all(color: Colors.white, width: 2),
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
                        style: TextStyle(color: Colors.blue[800], fontSize: 18),
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
                            Text("Görev Zamanı : "),
                            Spacer(),
                            Text(
                              DateFormat("dd/MM/yyyy kk:mm").format(taskDate),
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: dynamicHeight(0.01),
                        ),
                        Row(
                          children: [
                            Text("Tamamlanma Zamanı : "),
                            Spacer(),
                            Text(
                              DateFormat("dd/MM/yyyy kk:mm")
                                  .format(completeDate),
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
                          RouteHelper().push(context, DetailView(task: task));
                        },
                        child: Text("Detay"),
                      ),
                    ),
                    SizedBox(
                      width: dynamicWidth(0.02),
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
                          RouteHelper()
                              .push(context, MyRouteViewMapView(task: task));
                        },
                        child: Text("Rotayı Gör"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
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
}
