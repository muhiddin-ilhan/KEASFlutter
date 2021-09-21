// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailViewModel on _DetailViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_DetailViewModelBase.isLoading');

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

  final _$factoryInfoAtom = Atom(name: '_DetailViewModelBase.factoryInfo');

  @override
  DTOFactories? get factoryInfo {
    _$factoryInfoAtom.reportRead();
    return super.factoryInfo;
  }

  @override
  set factoryInfo(DTOFactories? value) {
    _$factoryInfoAtom.reportWrite(value, super.factoryInfo, () {
      super.factoryInfo = value;
    });
  }

  final _$pickerAtom = Atom(name: '_DetailViewModelBase.picker');

  @override
  ImagePicker get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
    });
  }

  final _$getDetailInfoAsyncAction =
      AsyncAction('_DetailViewModelBase.getDetailInfo');

  @override
  Future getDetailInfo(DTOTaskTruckUserRelation task) {
    return _$getDetailInfoAsyncAction.run(() => super.getDetailInfo(task));
  }

  final _$onCompleteTaskAsyncAction =
      AsyncAction('_DetailViewModelBase.onCompleteTask');

  @override
  Future onCompleteTask(BuildContext ctx, int taskId) {
    return _$onCompleteTaskAsyncAction
        .run(() => super.onCompleteTask(ctx, taskId));
  }

  final _$openSelectPhotoDialogAsyncAction =
      AsyncAction('_DetailViewModelBase.openSelectPhotoDialog');

  @override
  Future<void> openSelectPhotoDialog(
      BuildContext context, DTOTaskTruckUserRelation task) {
    return _$openSelectPhotoDialogAsyncAction
        .run(() => super.openSelectPhotoDialog(context, task));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
factoryInfo: ${factoryInfo},
picker: ${picker}
    ''';
  }
}
