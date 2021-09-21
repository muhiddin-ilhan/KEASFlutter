import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'global_view_model.g.dart';

class GlobalViewModel = _GlobalViewModelBase with _$GlobalViewModel;

abstract class _GlobalViewModelBase with Store {
  @observable
  GlobalKey? bottomNavigationKey;

  @computed
  get getBottomNavigationKey {
    if (bottomNavigationKey == null) bottomNavigationKey = GlobalKey();
    return bottomNavigationKey;
  }
}

GlobalViewModel? globalViewModel;

GlobalViewModel? get globalViewModelInstance {
  if (globalViewModel == null) {
    globalViewModel = GlobalViewModel();
  }
  return globalViewModel;
}
