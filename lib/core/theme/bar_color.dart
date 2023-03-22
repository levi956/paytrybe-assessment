import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarColor({required BarColor color}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarBrightness:
            color == BarColor.white ? Brightness.dark : Brightness.light),
  );
}

enum BarColor { white, black }

extension DarkMode on BuildContext {
  bool get isDarkMode {
    ThemeData data = Theme.of(this);
    return data.brightness == Brightness.dark;
  }
}
