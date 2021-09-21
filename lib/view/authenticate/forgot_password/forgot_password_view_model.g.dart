// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordViewModel on _ForgotPasswordViewModelBase, Store {
  final _$usernameControllerAtom =
      Atom(name: '_ForgotPasswordViewModelBase.usernameController');

  @override
  TextEditingController get usernameController {
    _$usernameControllerAtom.reportRead();
    return super.usernameController;
  }

  @override
  set usernameController(TextEditingController value) {
    _$usernameControllerAtom.reportWrite(value, super.usernameController, () {
      super.usernameController = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ForgotPasswordViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loadingOrSuccessAnimAtom =
      Atom(name: '_ForgotPasswordViewModelBase.loadingOrSuccessAnim');

  @override
  bool get loadingOrSuccessAnim {
    _$loadingOrSuccessAnimAtom.reportRead();
    return super.loadingOrSuccessAnim;
  }

  @override
  set loadingOrSuccessAnim(bool value) {
    _$loadingOrSuccessAnimAtom.reportWrite(value, super.loadingOrSuccessAnim,
        () {
      super.loadingOrSuccessAnim = value;
    });
  }

  final _$forgetPasswordAsyncAction =
      AsyncAction('_ForgotPasswordViewModelBase.forgetPassword');

  @override
  Future<void> forgetPassword(
      BuildContext ctx, AnimationController animationController) {
    return _$forgetPasswordAsyncAction
        .run(() => super.forgetPassword(ctx, animationController));
  }

  @override
  String toString() {
    return '''
usernameController: ${usernameController},
isLoading: ${isLoading},
loadingOrSuccessAnim: ${loadingOrSuccessAnim}
    ''';
  }
}
