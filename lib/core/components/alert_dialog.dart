import 'dart:io';

import 'package:flutter/material.dart';

Future<void> alertDialog({required String title, required String message, required BuildContext context, Function? onPressButton}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Anladım'),
            onPressed: () {
              Navigator.of(context).pop();
              if (onPressButton != null) {
                onPressButton();
              } else {
                exit(0);
              }
            },
          ),
        ],
      );
    },
  );
}
