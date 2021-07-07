import 'package:flutter/material.dart';

class XColors {

  static bool get getDarkMode => false;

  static Color background() => getDarkMode != true ? Color(0xFFFFFFFF) : Color(0xFF000000);
  static Color white() => getDarkMode != true ? Color(0xFF000000) : Color(0xFFFFFFFF);
  static Color textGrey() => getDarkMode != true ? Color(0xFF4041B4) : Color(0xFFDBD0D0);
  static Color mainColor() => getDarkMode != true ? Color(0xFF4041B4) : Color(0xFF4041B4);
  static Color primaryColor() => Color(0xFF4041B4);
  static Color decoratorContainerColor() => getDarkMode != true ? Color(0xFFFFFFFF) : Color(0xFF2D0203) ;
  static Color textColor() => getDarkMode != true ? Color(0xFF4041B4) : Color(0xFFFFFFFF);

  static const List<Color> grades_gradient = <Color>[
    Color(0xFF8CCA3B),
    Color(0xFF00A6E5)
  ];

}
