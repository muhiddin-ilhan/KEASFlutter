// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_shipments_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompletedShipmentsViewModel on _CompletedShipmentsViewModelBase, Store {
  final _$isLoadingAtom =
      Atom(name: '_CompletedShipmentsViewModelBase.isLoading');

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

  final _$allCompletedTaskAtom =
      Atom(name: '_CompletedShipmentsViewModelBase.allCompletedTask');

  @override
  List<DTOTaskTruckUserRelation> get allCompletedTask {
    _$allCompletedTaskAtom.reportRead();
    return super.allCompletedTask;
  }

  @override
  set allCompletedTask(List<DTOTaskTruckUserRelation> value) {
    _$allCompletedTaskAtom.reportWrite(value, super.allCompletedTask, () {
      super.allCompletedTask = value;
    });
  }

  final _$getCompletedShipmentsAsyncAction =
      AsyncAction('_CompletedShipmentsViewModelBase.getCompletedShipments');

  @override
  Future<void> getCompletedShipments(BuildContext ctx) {
    return _$getCompletedShipmentsAsyncAction
        .run(() => super.getCompletedShipments(ctx));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
allCompletedTask: ${allCompletedTask}
    ''';
  }
}
