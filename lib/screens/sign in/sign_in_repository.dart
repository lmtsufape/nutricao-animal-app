import 'dart:developer';

import 'package:flutter/material.dart';

class SignInRepository {
   Future<void> signIn({
    required String email,
    required String password,
    required VoidCallback onSuccess,}
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if(email != 'teste@teste.com' && password!= '12345678'){
      throw 'Email ou senha inválidos';
    }else{
      onSuccess();
      log('Fine. Successfully signed in. Now pushing to /home screen');
    }
  }
  
}