// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_gallery_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotoGalleryModel on _PhotoGalleryModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_PhotoGalleryModelBase.isLoading');

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

  final _$photosAtom = Atom(name: '_PhotoGalleryModelBase.photos');

  @override
  List<DTOPhoto> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(List<DTOPhoto> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  final _$getPhotosAsyncAction =
      AsyncAction('_PhotoGalleryModelBase.getPhotos');

  @override
  Future getPhotos(DTOTaskTruckUserRelation task) {
    return _$getPhotosAsyncAction.run(() => super.getPhotos(task));
  }

  final _$downloadPhotoAsyncAction =
      AsyncAction('_PhotoGalleryModelBase.downloadPhoto');

  @override
  Future<bool> downloadPhoto(DTOPhoto photo, BuildContext context) {
    return _$downloadPhotoAsyncAction
        .run(() => super.downloadPhoto(photo, context));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
photos: ${photos}
    ''';
  }
}
