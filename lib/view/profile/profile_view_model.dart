import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/gps/EService.dart';
import 'package:nestle_app/core/preferences/shared_preferences.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/view/authenticate/login/login_view.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  @observable
  String? name = "";
  @observable
  String? surname = "";

  @action
  getNameAndSurname() {
    if (AppSession.instance!.getUser() != null) {
      name = AppSession.instance!.getUser()!.Name ?? "";
      surname = AppSession.instance!.getUser()!.SurName ?? "";
    }
  }

  @action
  Future<void> signOut(BuildContext ctx) async {
    EService eService = new EService();
    eService.onStopBackgroundService();
    AppSession.instance!.setIsBackgroundTaskOpen(false);
    AppSession.instance!.setWhichTaskOpened(0);
    await SharedManager.instance.setStringValue("username", "");
    await SharedManager.instance.setStringValue("password", "");
    await RouteHelper().puhsAndCloseOther(ctx, LoginView());
  }
}
