// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$usernameControllerAtom =
      Atom(name: '_LoginViewModelBase.usernameController');

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

  final _$passwordControllerrAtom =
      Atom(name: '_LoginViewModelBase.passwordControllerr');

  @override
  TextEditingController get passwordControllerr {
    _$passwordControllerrAtom.reportRead();
    return super.passwordControllerr;
  }

  @override
  set passwordControllerr(TextEditingController value) {
    _$passwordControllerrAtom.reportWrite(value, super.passwordControllerr, () {
      super.passwordControllerr = value;
    });
  }

  final _$showPasswordAtom = Atom(name: '_LoginViewModelBase.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginViewModelBase.isLoading');

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
      Atom(name: '_LoginViewModelBase.loadingOrSuccessAnim');

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

  final _$loginAsyncAction = AsyncAction('_LoginViewModelBase.login');

  @override
  Future<void> login(
      BuildContext ctx, AnimationController animationController) {
    return _$loginAsyncAction.run(() => super.login(ctx, animationController));
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  dynamic setShowPassword() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setShowPassword');
    try {
      return super.setShowPassword();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usernameController: ${usernameController},
passwordControllerr: ${passwordControllerr},
showPassword: ${showPassword},
isLoading: ${isLoading},
loadingOrSuccessAnim: ${loadingOrSuccessAnim}
    ''';
  }
}
