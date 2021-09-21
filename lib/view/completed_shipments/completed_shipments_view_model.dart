import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/network/network_manager.dart';
part 'completed_shipments_view_model.g.dart';

class CompletedShipmentsViewModel = _CompletedShipmentsViewModelBase with _$CompletedShipmentsViewModel;

abstract class _CompletedShipmentsViewModelBase with Store {
  @observable
  bool isLoading = true;
  @observable
  List<DTOTaskTruckUserRelation> allCompletedTask = [];

  @action
  Future<void> getCompletedShipments(BuildContext ctx) async {
    isLoading = true;

    Map<String, dynamic> requestBody = {"UserId": AppSession.instance!.getUser()!.Id};

    NetworkManager.instance!.setHeader();
    NetworkManager.instance!.setBaseApiUrl();

    try {
      List<DTOTaskTruckUserRelation> tasks =
          await NetworkManager.instance!.dioPost("/TaskTruckUserRelation/GetCompletedTasksByUserId", DTOTaskTruckUserRelation(), requestBody);

      if (tasks.length > 0) {
        tasks.sort((a, b) => b.DischargeDate!.compareTo(a.DischargeDate!));
        allCompletedTask = tasks;
      }
    } catch (e) {
      print(e.toString());
      showSnackBar(ctx, "İnternet Bağlantınızı Kontrol Ediniz");
    }

    isLoading = false;
  }
}
