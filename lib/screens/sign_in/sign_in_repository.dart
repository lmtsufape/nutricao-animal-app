import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:thunderapp/shared/core/models/user_model.dart';
import 'package:dio/dio.dart' as dio;

class SignInRepository with ChangeNotifier {
  final _dio = Dio();

  Future<bool> login(
      BuildContext context, String email, String password) async {
    var response = await _dio.post('$kBaseUrl/login',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accepted": "application/json"
          },
        ),
        data: {
          "email": email,
          "password": password,
        });

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.data);
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('id', response.data['user']['id']);
      prefs.setString('email', email);
      prefs.setString('password', password);
      prefs.setString('token', response.data['user']['token'].toString());
      prefs.setString('name', response.data['user']['name'].toString());
      print(response.data['name']);

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
