import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/application/app_session.dart';
import 'package:nestle_app/core/components/bottomNavBar/bottom_nav_bar.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/model/DTOUser.dart';
import 'package:nestle_app/core/network/network_manager.dart';
import 'package:nestle_app/core/preferences/shared_preferences.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  TextEditingController usernameController = TextEditingController();
  @observable
  TextEditingController passwordControllerr = TextEditingController();
  @observable
  bool showPassword = true;
  @observable
  bool isLoading = false;
  @observable
  bool loadingOrSuccessAnim = true;

  @action
  setShowPassword() {
    showPassword = !showPassword;
  }

  setSharedPrefs() async {
    await SharedManager.instance.setStringValue("username", usernameController.text);
    await SharedManager.instance.setStringValue("password", passwordControllerr.text);
  }

  @action
  Future<void> login(BuildContext ctx, AnimationController animationController) async {
    isLoading = true;

    if (validateUsername(ctx) && validatePassword(ctx)) {
      DTOUser loginData = new DTOUser(Identity: usernameController.text, Password: passwordControllerr.text);

      try {
        loginData = await NetworkManager.instance!.dioPost("/Authentication/Login", DTOUser(), loginData);

        if (loginData.LoginResult == null) {
          showSnackBar(ctx, "Bilinmeyen Bir Hata Oluştu");
          return;
        }

        if (loginData.LoginResult!.IsSuccess == null) {
          showSnackBar(ctx, "Bilinmeyen Bir Hata Oluştu");
          return;
        }

        if (loginData.LoginResult!.IsSuccess!) {
          successAnimStart(animationController);
          setSharedPrefs();
          AppSession.instance!.setUser(loginData);
          Future.delayed(Duration(milliseconds: 1250), () {
            successAnimStop(animationController);
            isLoading = false;
            RouteHelper().pushReplacement(ctx, BottomNavigationManager());
          });
          return;
        } else {
          if (loginData.LoginResult!.ResultMessage == null) return;
          showSnackBar(ctx, loginData.LoginResult!.ResultMessage!);
        }
      } catch (e) {
        isLoading = false;
        showSnackBar(ctx, "İnternet Bağlantınızı Kontrol Ediniz");
      }
    }
  }

  bool validateUsername(BuildContext ctx) {
    if (usernameController.text.isEmpty) {
      showSnackBar(ctx, "Kullanıcı Adı Boş Bırakılamaz");
      isLoading = false;
      return false;
    }

    return true;
  }

  bool validatePassword(BuildContext ctx) {
    if (passwordControllerr.text.isEmpty) {
      showSnackBar(ctx, "Şifre Boş Bırakılamaz");
      isLoading = false;
      return false;
    }

    return true;
  }

  void successAnimStart(AnimationController animationController) async {
    animationController.reset();
    animationController.forward();
    loadingOrSuccessAnim = false;
  }

  void successAnimStop(AnimationController animationController) async {
    animationController.reset();
    loadingOrSuccessAnim = true;
  }
}
