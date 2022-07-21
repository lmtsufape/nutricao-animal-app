import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: kDefaultFontFamily,
    );
  }
}
