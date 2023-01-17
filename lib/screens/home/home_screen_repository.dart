import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';

class HomeScreenRepository {
  Dio dio = Dio();

  Future<List<dynamic>> getAnimalData() async {
    final prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('id');
    var userToken = prefs.getString('token');

    var response = await dio.get(
      '$kBaseUrl/users/$userId/animals',
      options: Options(headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $userToken"
      }),
    );
    if (response.statusCode == 200) {
      var animalData = response.data;
      return animalData['animal'];
    } else {
      return [];
    }
  }
}
