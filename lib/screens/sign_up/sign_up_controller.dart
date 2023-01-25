import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //Recebe uma string
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  String? erroMessage;
  var status = SignUpStatus.idle;
}

bool validateFields(String nome, String email, String senha, String confSenha) {
  if (nome.isEmpty || email.isEmpty || senha.isEmpty || confSenha.isEmpty) {
    return false;
  } else if (senha != confSenha) {
    return false;
  }
  return true;
}
