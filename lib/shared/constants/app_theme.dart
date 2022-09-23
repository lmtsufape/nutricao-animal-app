import 'package:thunderapp/app.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: kDefaultFontFamily,
    );
  }
}

AppBar AppBarCustom(BuildContext context) {
  return AppBar(title: const Text('Olá Ana!'), actions: [
    IconButton(
      icon: const Icon(Icons.account_circle_rounded),
      onPressed: () => Navigator.pushNamed(context, Screens.user),
    ),
  ]);
}
