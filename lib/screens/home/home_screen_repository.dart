import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/constants/app_text_constants.dart';

class HomeScreenRepository {
  Dio dio = Dio();

  Future getAnimalData(BuildContext context) async {
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
      var dataList = response.data['animals'] as List<dynamic>;

      return dataList;
    } else {
      return null;
    }
  }
}
