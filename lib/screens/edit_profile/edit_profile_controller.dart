import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens_index.dart';

class EditProfileController {
  logoff(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.popAndPushNamed(context, Screens.signin);
  }
}
