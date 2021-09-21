import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/gps/EService.dart';
import 'package:nestle_app/core/model/DTOBackground.dart';
import 'package:nestle_app/core/model/DTOFactories.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/network/network_manager.dart';
import 'package:nestle_app/core/preferences/shared_preferences.dart';
part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  @observable
  bool isLoading = true;
  @observable
  List<DTOTaskTruckUserRelation> allTasks = [];
  @observable
  bool? isBackgroundTaskOpen = false;
  @observable
  int whichTaskOpened = 0;

  EService eService = new EService();

  @action
  Future<void> getIncompletedShipments(BuildContext ctx) async {
    isLoading = true;

    Map<String, dynamic> requestBody = {"UserId": AppSession.instance!.getUser()!.Id};

    NetworkManager.instance!.setHeader();
    NetworkManager.instance!.setBaseApiUrl();

    try {
      List<DTOTaskTruckUserRelation> tasks =
          await NetworkManager.instance!.dioPost("/TaskTruckUserRelation/GetIncompletedTasksByUserId", DTOTaskTruckUserRelation(), requestBody);

      if (tasks.length > 0) {
        tasks.sort((a, b) => a.EntryDate!.compareTo(b.EntryDate!));
        allTasks = tasks;
      }
    } catch (e) {
      print(e.toString());
      showSnackBar(ctx, "İnternet Bağlantınızı Kontrol Ediniz");
    }

    isLoading = false;
  }

  @action
  Future<void> isBackgroundTaskOpened() async {
    SharedManager.instance.getBoolValue("isBackgroundOpen").then((value) {
      if (value == null) {
        SharedManager.instance.setBoolValue("isBackgroundOpen", false);
      } else {
        isBackgroundTaskOpen = value;
      }
    });

    SharedManager.instance.getIntValue("whichBackgroundTask").then((value) {
      if (value == null) {
        SharedManager.instance.setIntValue("whichBackgroundTask", 0);
      } else {
        whichTaskOpened = value;
      }
    });
  }

  @action
  Future<void> onStart(BuildContext context, DTOTaskTruckUserRelation task) async {
    List<double> facCoords = await getFactoryCoords(task);

    if (facCoords.length == 0) {
      showSnackBar(context, "Hata Oluştu");
      return;
    }

    DTOBackground dtoBackground = new DTOBackground(
      UserId: task.UserId,
      TruckId: task.TruckId,
      ShipmentId: task.TaskId,
      RelationId: task.Id,
      FactoryCoord: facCoords,
      Token: AppSession.instance!.getUser()!.Token,
    );

    await eService.onStartBackgroundService(dtoBackground);

    SharedManager.instance.setBoolValue("isBackgroundOpen", true);
    SharedManager.instance.setIntValue("whichBackgroundTask", task.Id!);
    SharedManager.instance.setStringValue("shipmentInfo", task.UserId.toString()+"//"+task.TruckId.toString()+"//"+task.TaskId.toString()+"//"+task.Id.toString());
    isBackgroundTaskOpen = true;
    whichTaskOpened = task.Id!;

    showSnackBar(context, "Başladı!");
  }

  @action
  Future<void> onStop(BuildContext context) async {
    await eService.onStopBackgroundService();

    SharedManager.instance.setBoolValue("isBackgroundOpen", false);
    SharedManager.instance.setIntValue("whichBackgroundTask", 0);
    isBackgroundTaskOpen = false;
    whichTaskOpened = 0;

    showSnackBar(context, "Durduruldu!");
  }

  Future<List<double>> getFactoryCoords(DTOTaskTruckUserRelation task) async {
    try {
      await NetworkManager.instance!.setHeader();
      await NetworkManager.instance!.setBaseApiUrl();
      DTOFactories response = await NetworkManager.instance!.dioPost("/Factories/GetFactoryById", DTOFactories(), {"Id": task.Task!.FactoryId});
      return [response.Lat!, response.Lon!];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
