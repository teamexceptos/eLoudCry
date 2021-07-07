import 'package:eloudcry/utils/colors.dart';
import 'package:flutter/material.dart';

void showActionDialog(BuildContext context, {
  String message,
  String negative = 'Back',
  String positive,
  Function onPressed}) {
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      content: Text(
        message == null ? "Dialog action" : message,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: XColors.textColor()),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            negative,
            style: TextStyle(color: XColors.textColor()),
          ),
        ),
        TextButton(
          onPressed: onPressed ?? () {},
          child: Text(
            positive == null ? "OK" : positive,
            style: TextStyle(
                color: XColors.textColor(), fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  });
}