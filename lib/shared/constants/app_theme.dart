import 'package:thunderapp/app.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:provider/provider.dart';

import '../core/models/user_model.dart';

class AppTheme extends ChangeNotifier {
  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: kDefaultFontFamily,
    );
  }

  AppBar appBarCustom(BuildContext context, String userName) {
    return AppBar(title: Text('Olá $userName'), actions: [
      IconButton(
        icon: const Icon(Icons.account_circle_rounded),
        onPressed: () => Navigator.pushNamed(context, Screens.user),
      ),
    ]);
  }
}
