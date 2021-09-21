import 'package:flutter/material.dart';
import 'package:nestle_app/core/components/item_add_dialog_item_card.dart';
import 'package:nestle_app/core/localization/app_localization.dart';

itemAddDialog(double height, double width, BuildContext context) {
  AppLocalizations.of(context);
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 3,
    backgroundColor: Color.fromRGBO(230, 230, 230, 1),
    child: Container(
      height: height,
      width: width,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade600, Colors.blue.shade800],
                ),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.getString("add_product"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.009),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ItemAddDialogItemCard(),
                          ItemAddDialogItemCard(),
                          ItemAddDialogItemCard(),
                          ItemAddDialogItemCard(),
                          ItemAddDialogItemCard(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: MaterialButton(
                      elevation: 1,
                      minWidth: width,
                      height: height * 0.1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      disabledColor: Colors.blue.shade900,
                      child: Text(
                        AppLocalizations.getString("add"),
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue.shade700,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
