import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //Recebe uma string
  TextEditingController get nameController => _nameController;
  TextEditingController get cpfController => _cpfController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  String? erroMessage;
  var status = SignUpStatus.idle;
}

MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

bool validateFields(
    String nome, String cpf, String email, String senha, String confSenha) {
  if (nome.isEmpty ||
      cpf.isEmpty ||
      email.isEmpty ||
      senha.isEmpty ||
      confSenha.isEmpty) {
    return false;
  } else if (senha != confSenha) {
    return false;
  }
  return true;
}
