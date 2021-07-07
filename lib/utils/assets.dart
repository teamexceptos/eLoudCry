import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

mixin MkImageAssets {

  static SvgPicture splashIcon({Color color, double width, double height}) => SvgPicture.asset(
    'assets/images/splash_icon.svg', height: 120, width: 120, fit: BoxFit.fitWidth,
  );

  static SvgPicture audioPlay({Color color, double width, double height}) => SvgPicture.asset(
    'assets/images/audio_play.svg', height: height ?? 90, width: width ?? 90, fit: BoxFit.fitWidth,
  );

  static SvgPicture locationSearch({Color color, double width, double height}) => SvgPicture.asset(
    'assets/images/location_search.svg', height: height ?? 90, width: width ?? 90, fit: BoxFit.fitWidth,
  );

  static SvgPicture messagingFeature({Color color, double width, double height}) => SvgPicture.asset(
    'assets/images/messaging_feature.svg', height: height ?? 90, width: width ?? 90, fit: BoxFit.fitWidth,
  );

  static SvgPicture personalInfo({Color color, double width, double height}) => SvgPicture.asset(
    'assets/images/personal_info.svg', height: height ?? 90, width: width ?? 90, fit: BoxFit.fitWidth,
  );

}
