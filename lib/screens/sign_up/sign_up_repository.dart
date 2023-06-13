import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../shared/components/dialogs/add_user_dialog.dart';

class SignUpRepository {
  static void signUp(name, cpf, email, password, context) async {
    final dio = Dio();

    if (name.toString().isEmpty ||
        cpf.toString().isEmpty ||
        email.toString().isEmpty ||
        password.toString().isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Impossível adicionar usuário'),
                content: MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  color: kDetailColor,
                  child: const Text(
                    'Ok!',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                ),
              ));
    } else {
      var response = await dio.post(
        '$kBaseUrl/users',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
        ),
        data: {
          "name": name,
          "cpf": cpf,
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (context) =>
                AddUserDialog(email.toString(), password.toString()));
      } else {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Impossível adicionar usuário'),
                  content: Text('Ok!'),
                ));
      }
    }
  }
}
