import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF15202B),
    cardColor: const Color(0xFF2F2F2F),
    canvasColor: Colors.white,
    primaryColor: Colors.black,
    fontFamily: 'TT-Commons',
    brightness: Brightness.dark,
  );

  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF7F9FD),
    cardColor: Colors.white,
    canvasColor: Colors.black,
    primaryColor: const Color(0xFF4168F6),
    brightness: Brightness.light,
    fontFamily: 'TT-Commons',
  );
}

class AppColors {
  static const Color primaryColor = Color(0xFF4168F6);
  static const Color darkPrimary = Color(0xFF011B33);
}
