import 'package:eloudcry/utils/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  GlobalKey<ScaffoldState> _scaffoldKey, {
  String message = 'An error occured',
  String label = 'DISMISS',
  Function onPressed,
  int duration
}) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    backgroundColor: XColors.mainColor(),
    content: Text(
      message == null
          ? 'An error occured'
          : message.isNotEmpty ? message : 'An error occured',
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Montserrat",
        fontSize: 14,
      ),
    ),
    duration: Duration(seconds: duration ?? 5 ),
    action: SnackBarAction(
      label: label,
      textColor: Colors.white,
      onPressed: onPressed ?? () {},
    ),
  ));
}
