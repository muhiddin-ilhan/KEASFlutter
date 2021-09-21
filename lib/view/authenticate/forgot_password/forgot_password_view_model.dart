import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:nestle_app/core/components/snack_bar.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
part 'forgot_password_view_model.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  @observable
  TextEditingController usernameController = TextEditingController();
  @observable
  bool isLoading = false;
  @observable
  bool loadingOrSuccessAnim = true;

  @action
  Future<void> forgetPassword(BuildContext ctx, AnimationController animationController) async {
    isLoading = true;

    if (validateUsername(ctx)) {
      await Future.delayed(Duration(milliseconds: 800), () async {
        successAnimStart(animationController);
        await Future.delayed(Duration(milliseconds: 1250), () async {
          successAnimStop(animationController);
          isLoading = false;
          RouteHelper().pop(ctx);
        });
      });
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
