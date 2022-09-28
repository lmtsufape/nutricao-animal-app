import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:thunderapp/shared/core/models/user_model.dart';
import 'package:dio/dio.dart' as dio;

class SignInRepository {
  final _dio = Dio();

  Future<bool> login(String email, String password) async {
    final UserModel userModel = UserModel();

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
      userModel.setUser(response.data['name'], response.data['token']);
      return true;
    } else {
      return false;
    }
  }
}
