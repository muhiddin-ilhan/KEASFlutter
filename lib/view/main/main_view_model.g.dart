// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainViewModel on _MainViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_MainViewModelBase.isLoading');

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

  final _$allTasksAtom = Atom(name: '_MainViewModelBase.allTasks');

  @override
  List<DTOTaskTruckUserRelation> get allTasks {
    _$allTasksAtom.reportRead();
    return super.allTasks;
  }

  @override
  set allTasks(List<DTOTaskTruckUserRelation> value) {
    _$allTasksAtom.reportWrite(value, super.allTasks, () {
      super.allTasks = value;
    });
  }

  final _$isBackgroundTaskOpenAtom =
      Atom(name: '_MainViewModelBase.isBackgroundTaskOpen');

  @override
  bool? get isBackgroundTaskOpen {
    _$isBackgroundTaskOpenAtom.reportRead();
    return super.isBackgroundTaskOpen;
  }

  @override
  set isBackgroundTaskOpen(bool? value) {
    _$isBackgroundTaskOpenAtom.reportWrite(value, super.isBackgroundTaskOpen,
        () {
      super.isBackgroundTaskOpen = value;
    });
  }

  final _$whichTaskOpenedAtom =
      Atom(name: '_MainViewModelBase.whichTaskOpened');

  @override
  int get whichTaskOpened {
    _$whichTaskOpenedAtom.reportRead();
    return super.whichTaskOpened;
  }

  @override
  set whichTaskOpened(int value) {
    _$whichTaskOpenedAtom.reportWrite(value, super.whichTaskOpened, () {
      super.whichTaskOpened = value;
    });
  }

  final _$getIncompletedShipmentsAsyncAction =
      AsyncAction('_MainViewModelBase.getIncompletedShipments');

  @override
  Future<void> getIncompletedShipments(BuildContext ctx) {
    return _$getIncompletedShipmentsAsyncAction
        .run(() => super.getIncompletedShipments(ctx));
  }

  final _$isBackgroundTaskOpenedAsyncAction =
      AsyncAction('_MainViewModelBase.isBackgroundTaskOpened');

  @override
  Future<void> isBackgroundTaskOpened() {
    return _$isBackgroundTaskOpenedAsyncAction
        .run(() => super.isBackgroundTaskOpened());
  }

  final _$onStartAsyncAction = AsyncAction('_MainViewModelBase.onStart');

  @override
  Future<void> onStart(BuildContext context, DTOTaskTruckUserRelation task) {
    return _$onStartAsyncAction.run(() => super.onStart(context, task));
  }

  final _$onStopAsyncAction = AsyncAction('_MainViewModelBase.onStop');

  @override
  Future<void> onStop(BuildContext context) {
    return _$onStopAsyncAction.run(() => super.onStop(context));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
allTasks: ${allTasks},
isBackgroundTaskOpen: ${isBackgroundTaskOpen},
whichTaskOpened: ${whichTaskOpened}
    ''';
  }
}
