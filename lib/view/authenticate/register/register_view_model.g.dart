// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$usernameControllerAtom =
      Atom(name: '_RegisterViewModelBase.usernameController');

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

  final _$passwordControllerAtom =
      Atom(name: '_RegisterViewModelBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$nameControllerAtom =
      Atom(name: '_RegisterViewModelBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$surnameControllerAtom =
      Atom(name: '_RegisterViewModelBase.surnameController');

  @override
  TextEditingController get surnameController {
    _$surnameControllerAtom.reportRead();
    return super.surnameController;
  }

  @override
  set surnameController(TextEditingController value) {
    _$surnameControllerAtom.reportWrite(value, super.surnameController, () {
      super.surnameController = value;
    });
  }

  final _$showPasswordAtom = Atom(name: '_RegisterViewModelBase.showPassword');

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

  final _$isLoadingAtom = Atom(name: '_RegisterViewModelBase.isLoading');

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
      Atom(name: '_RegisterViewModelBase.loadingOrSuccessAnim');

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

  final _$registerAsyncAction = AsyncAction('_RegisterViewModelBase.register');

  @override
  Future<void> register(
      BuildContext ctx, AnimationController animationController) {
    return _$registerAsyncAction
        .run(() => super.register(ctx, animationController));
  }

  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  dynamic setShowPassword() {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setShowPassword');
    try {
      return super.setShowPassword();
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateUsername(BuildContext ctx) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateUsername');
    try {
      return super.validateUsername(ctx);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validatePassword(BuildContext ctx) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validatePassword');
    try {
      return super.validatePassword(ctx);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateName(BuildContext ctx) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateName');
    try {
      return super.validateName(ctx);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateSurname(BuildContext ctx) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.validateSurname');
    try {
      return super.validateSurname(ctx);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usernameController: ${usernameController},
passwordController: ${passwordController},
nameController: ${nameController},
surnameController: ${surnameController},
showPassword: ${showPassword},
isLoading: ${isLoading},
loadingOrSuccessAnim: ${loadingOrSuccessAnim}
    ''';
  }
}
