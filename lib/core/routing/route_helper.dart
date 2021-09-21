import 'package:flutter/material.dart';

class RouteHelper {
  Future pushReplacement(BuildContext context, dynamic view) async {
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => view));
  }

  Future push(BuildContext context, dynamic view) async {
    await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => view));
  }

  Future pop(BuildContext context) async {
    Navigator.pop(context);
  }

  Future puhsAndCloseOther(BuildContext context, dynamic view) async {
    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => view), (route) => false);
  }
}
