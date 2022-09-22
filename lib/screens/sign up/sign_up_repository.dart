import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart' as dio;
import 'package:thunderapp/shared/constants/app_text_constants.dart';

class SignUpRepository {
  static void signUp(name, email, password) async {
    final dio = Dio();
    var response = await dio.post('$kBaseUrl/user/login',
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
        data: {
          "email": email,
          "password": password,
        });
    print(response.statusCode);
  }
}
