import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:dio/dio.dart';
import 'package:thunderapp/shared/core/models/breed_model.dart';

class AddAnimalRepository {
  Future<bool> getBreed() async {
    Dio dio = Dio();

    var response = await dio.get('$kBaseUrl/users/breed/cat');

    print(response.statusCode);
    print(response.data);

    return true;
  }
}
