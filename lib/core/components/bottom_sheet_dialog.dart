import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

void openBottomSheetDialog(
    {required BuildContext context,
    required String dialogTitle,
    required String dialogMessage,
    required String negativeButtonText,
    required Function negativeButtonOnPress,
    required String positiveButtonText,
    required Function positiveButtonOnPress,
    bool? barrierDismissible,
    IconData? negativeButtonIcon,
    IconData? positiveButtonIcon,
    Color? negativeButtonColor,
    Color? positiveButtonColor,
    Color? negativeButtonIconColor,
    Color? positiveButtonIconColor,
    Color? negativeButtonTextColor,
    Color? positiveButtonTextColor}) async {
  Dialogs.bottomMaterialDialog(
      context: context,
      msg: dialogMessage,
      title: dialogTitle,
      barrierDismissible: barrierDismissible ?? true,
      actions: [
        IconsButton(
          onPressed: negativeButtonOnPress,
          text: negativeButtonText,
          iconData: negativeButtonIcon ?? Icons.close,
          color: negativeButtonColor ?? Colors.white,
          textStyle: TextStyle(color: negativeButtonTextColor ?? Colors.black),
          iconColor: negativeButtonIconColor ?? Colors.black,
        ),
        IconsButton(
          onPressed: positiveButtonOnPress,
          text: positiveButtonText,
          iconData: positiveButtonIcon ?? Icons.done,
          color: positiveButtonColor ?? Colors.blue[700],
          textStyle: TextStyle(color: positiveButtonTextColor ?? Colors.white),
          iconColor: positiveButtonIconColor ?? Colors.white,
        ),
      ],
      color: Color.fromRGBO(230, 230, 230, 1));
}
