import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

mixin MkImageAssets {

  static SvgPicture splash_icon({Color color, int width, int height}) => SvgPicture.asset(
    'assets/images/splash_icon.svg', height: height ?? 60, width: width ?? 60, fit: BoxFit.fitWidth,
  );

}
