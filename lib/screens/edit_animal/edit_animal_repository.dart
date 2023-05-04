import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';

import '../screens_index.dart';

class EditAnimalRepository {
  late int userId;
  late String userToken;

  Future<bool> patchAnimal(
      animalID, nome, sex, castrated, weight, height, specie, context) async {
    Dio dio = Dio();

    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    print(double.parse(weight));

    var response = await dio.patch(
      '$kBaseUrl/users/$userId/animals/$animalID',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
      data: {
        "name": nome,
        "sex": sex,
        "is_castrated": castrated,
      },
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
    Navigator.pushNamed(context, Screens.home);
    return response.statusCode == 200 || response.statusCode == 201
        ? true
        : false;
  }
}
