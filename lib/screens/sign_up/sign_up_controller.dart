import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:http/http.dart';

import 'sign_up_repository.dart';

enum SignUpStatus {
  done,
  error,
  loading,
  idle,
}

class SignUpController with ChangeNotifier {
  //variável do repositório  signup

  String? displayName;
  String? email;
  String? password;
  String? confirmPassword;

  //TextEditingController = recupera os valores dos campos
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Recebe uma string
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String? erroMessage;
  var status = SignUpStatus.idle;
}
