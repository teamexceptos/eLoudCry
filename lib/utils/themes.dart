import 'package:flutter/material.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Color(0xFF4041B4),
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFFFFFFF),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: "Comfortaa",
  );
}

ThemeData _buildDarkTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Color(0xFF4041B4),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF000000),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: "Comfortaa",
  );
}

class ThemesSetup {

  factory ThemesSetup() {
    return _instance;
  }

  ThemesSetup._();

  static ThemesSetup _instance;
  static bool isDark;

}
