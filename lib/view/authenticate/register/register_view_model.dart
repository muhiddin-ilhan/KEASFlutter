import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  TextEditingController usernameController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController surnameController = TextEditingController();
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

  @action
  Future<void> register(BuildContext ctx, AnimationController animationController) async {
    if (!validateName(ctx)) return;
    if (!validateSurname(ctx)) return;
    if (!validatePassword(ctx)) return;
    if (!validateUsername(ctx)) return;

    isLoading = true;
    await Future.delayed(Duration(milliseconds: 800), () async {
      successAnimStart(animationController);
      await Future.delayed(Duration(milliseconds: 1250), () async {
        successAnimStop(animationController);
        isLoading = false;
        RouteHelper().pop(ctx);
      });
    });
  }

  @action
  bool validateUsername(BuildContext ctx) {
    if (usernameController.text.isEmpty) {
      showSnackBar(ctx, "Kullanıcı Adı Boş Bırakılamaz");
      isLoading = false;
      return false;
    }

    return true;
  }

  @action
  bool validatePassword(BuildContext ctx) {
    if (passwordController.text.isEmpty) {
      showSnackBar(ctx, "Şifre Boş Bırakılamaz");
      isLoading = false;
      return false;
    }

    return true;
  }

  @action
  bool validateName(BuildContext ctx) {
    if (nameController.text.isEmpty) {
      showSnackBar(ctx, "İsim Boş Bırakılamaz");
      isLoading = false;
      return false;
    }

    return true;
  }

  @action
  bool validateSurname(BuildContext ctx) {
    if (surnameController.text.isEmpty) {
      showSnackBar(ctx, "Soyisim Boş Bırakılamaz");
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
