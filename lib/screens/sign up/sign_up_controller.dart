import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';

import 'sign_up_repository.dart';

enum SignUpStatus {
  done,
  error,
  loading,
  idle,
}

class SignUpController with ChangeNotifier {
  //variável do repositório  signup
  final SignUpRepository _repository = SignUpRepository();
  String? displayName;
  String? email;
  String? password;
  String? confirmPassword;

  //TextEditingController = recupera os valores dos campos
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //Recebe uma string
  TextEditingController get displayNameController => _displayNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  String? erroMessage = '';
  var status = SignUpStatus.idle;

  void signUp(BuildContext context) async {}
}
