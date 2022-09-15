import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SignUpRepository {
  static void signUp(name, email, password) async {
    http.Response response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/user/'), body: {
      'name': name,
      'email': email,
      'password': password,
    });
    print(response.statusCode);
  }
}
