// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  final _$loadingTextAtom = Atom(name: '_SplashViewModelBase.loadingText');

  @override
  String get loadingText {
    _$loadingTextAtom.reportRead();
    return super.loadingText;
  }

  @override
  set loadingText(String value) {
    _$loadingTextAtom.reportWrite(value, super.loadingText, () {
      super.loadingText = value;
    });
  }

  final _$isUserLoginAsyncAction =
      AsyncAction('_SplashViewModelBase.isUserLogin');

  @override
  Future isUserLogin(BuildContext ctx) {
    return _$isUserLoginAsyncAction.run(() => super.isUserLogin(ctx));
  }

  final _$isThereNotSendingDataAsyncAction =
      AsyncAction('_SplashViewModelBase.isThereNotSendingData');

  @override
  Future isThereNotSendingData(BuildContext ctx) {
    return _$isThereNotSendingDataAsyncAction
        .run(() => super.isThereNotSendingData(ctx));
  }

  final _$checkLocationPermissionAsyncAction =
      AsyncAction('_SplashViewModelBase.checkLocationPermission');

  @override
  Future<bool> checkLocationPermission() {
    return _$checkLocationPermissionAsyncAction
        .run(() => super.checkLocationPermission());
  }

  final _$downloadDangerAreasAsyncAction =
      AsyncAction('_SplashViewModelBase.downloadDangerAreas');

  @override
  Future<dynamic> downloadDangerAreas() {
    return _$downloadDangerAreasAsyncAction
        .run(() => super.downloadDangerAreas());
  }

  final _$addDbDangerAreasAsyncAction =
      AsyncAction('_SplashViewModelBase.addDbDangerAreas');

  @override
  Future<dynamic> addDbDangerAreas(DTODangerArea area) {
    return _$addDbDangerAreasAsyncAction
        .run(() => super.addDbDangerAreas(area));
  }

  @override
  String toString() {
    return '''
loadingText: ${loadingText}
    ''';
  }
}
