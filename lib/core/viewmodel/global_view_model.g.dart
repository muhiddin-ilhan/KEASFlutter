// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalViewModel on _GlobalViewModelBase, Store {
  Computed<dynamic>? _$getBottomNavigationKeyComputed;

  @override
  dynamic get getBottomNavigationKey => (_$getBottomNavigationKeyComputed ??=
          Computed<dynamic>(() => super.getBottomNavigationKey,
              name: '_GlobalViewModelBase.getBottomNavigationKey'))
      .value;

  final _$bottomNavigationKeyAtom =
      Atom(name: '_GlobalViewModelBase.bottomNavigationKey');

  @override
  GlobalKey<State<StatefulWidget>>? get bottomNavigationKey {
    _$bottomNavigationKeyAtom.reportRead();
    return super.bottomNavigationKey;
  }

  @override
  set bottomNavigationKey(GlobalKey<State<StatefulWidget>>? value) {
    _$bottomNavigationKeyAtom.reportWrite(value, super.bottomNavigationKey, () {
      super.bottomNavigationKey = value;
    });
  }

  @override
  String toString() {
    return '''
bottomNavigationKey: ${bottomNavigationKey},
getBottomNavigationKey: ${getBottomNavigationKey}
    ''';
  }
}
