import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:dio/dio.dart';
import 'package:thunderapp/shared/core/models/breed_model.dart';

class AddAnimalRepository {
  late int userId;
  late String userToken;

  Future<bool> getBreedCat() async {
    Dio dio = Dio();

    var response = await dio.get('$kBaseUrl/users/breed/species');

    print(response.statusCode);
    print(response.data);

    return true;
  }

  Future<bool> getBreedDog() async {
    Dio dio = Dio();

    var response = await dio.get('$kBaseUrl/user/breeds/dog');

    print(response.statusCode);
    print(response.data);

    return true;
  }

  Future<bool> registerAnimal(name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await dio.post(
      '$kBaseUrl/users/$userId/animals/complete',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
      data: {
        "animal": {
          "name": name,
          "sex": sex,
          "is_castrated": isCastrated,
          "activity_level": activityLevel
        },
        "biometry": {
          "weight": weight,
          "height": height,
        },
        "breed": breed
      },
    );
    print(response.statusCode);

    return true;
  }
}
