import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/edit_profile/edit_profile_repository.dart';

import '../screens_index.dart';

class EditProfileController {
  final EditProfileRepository _repository = EditProfileRepository();

  logoff(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.popAndPushNamed(context, Screens.signin);
  }

  void editUser(
      TextEditingController name, TextEditingController email, context) async {
    if (name.text.isEmpty && email.text.isEmpty) {
      print('Preencha os campos para editar');
    } else {
      var succ = await _repository.patchUser(name.text, email.text);
      if (succ) {
        logoff(context);
      } else {
        print('Erro');
      }
    }
  }
}
