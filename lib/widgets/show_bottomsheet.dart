import 'package:eloudcry/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void modalBottomSheetMenu({BuildContext context, Widget child, Color color}) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: color ?? XColors.background(),
      builder: (builder) {
        return child;
      }
  );
}