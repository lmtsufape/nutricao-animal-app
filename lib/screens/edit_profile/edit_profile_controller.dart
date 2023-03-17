import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/edit_profile/edit_profile_repository.dart';

import '../screens_index.dart';

class EditProfileController {
  EditProfileRepository _repository = EditProfileRepository();

  logoff(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.popAndPushNamed(context, Screens.signin);
  }

  void editUser(name, email, context) async {
    var succ = await _repository.patchUser(name, email);

    if (succ) {
      logoff(context);
    } else {
      print('Erro');
    }
  }
}
