import 'dart:io';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/viewmodel/global_view_model.dart';
import 'package:nestle_app/view/completed_shipments/completed_shipments_view.dart';
import 'package:nestle_app/view/main/main_view.dart';
import 'package:nestle_app/view/map/map_view.dart';

import '../bottom_sheet_dialog.dart';

class BottomNavigationManager extends StatefulWidget {
  final int initialPage;

  const BottomNavigationManager({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  _BottomNavigationManagerState createState() => _BottomNavigationManagerState();
}

class _BottomNavigationManagerState extends State<BottomNavigationManager> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        body: Container(
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
              iconData: Icons.home,
              title: AppLocalizations.getString("home_page_title"),
              onclick: () {
                final FancyBottomNavigationState fState = globalViewModelInstance?.getBottomNavigationKey.currentState;
                fState.setPage(0);
              },
            ),
            TabData(
              iconData: Icons.map,
              title: AppLocalizations.getString("map"),
              onclick: () {
                final FancyBottomNavigationState fState = globalViewModelInstance?.getBottomNavigationKey.currentState;
                fState.setPage(1);
              },
            ),
            TabData(
              iconData: Icons.flag,
              title: "Tamamlanan",
              onclick: () {
                final FancyBottomNavigationState fState = globalViewModelInstance?.getBottomNavigationKey.currentState;
                fState.setPage(2);
              },
            ),
          ],
          circleColor: Colors.blue.shade700,
          initialSelection: widget.initialPage,
          key: globalViewModelInstance?.getBottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return MainView();
      case 1:
        return MapView();
      case 2:
        return CompletedShipmentsView();
      default:
        return MainView();
    }
  }

  Future<bool> onBackPress() async {
    if (currentPage != 0) {
      final FancyBottomNavigationState fState = globalViewModelInstance?.getBottomNavigationKey.currentState;
      fState.setPage(0);
    } else {
      openBottomSheetDialog(
          context: context,
          dialogTitle: "Çıkış Yap",
          dialogMessage: "Çıkış yapmak istediğinize emin misiniz?",
          negativeButtonText: "Hayır",
          negativeButtonOnPress: () {
            Navigator.pop(context);
          },
          positiveButtonText: "Evet",
          positiveButtonOnPress: () {
            exit(0);
          });
    }

    return false;
  }
}
