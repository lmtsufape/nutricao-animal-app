import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/constants/app_text_constants.dart';
import '../../shared/core/models/animal_model.dart';

class AnimalDetailsController with ChangeNotifier {
  Future<double> caloric(AnimalModel animal) async {
    Dio dio = Dio();
    DateTime date = DateTime.now();
    double caloric = 0;

    final prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt('id')!;
    var userToken = prefs.getString('token')!;

    var response = await dio.get(
      '$kBaseUrl/users/$userId/animals/${animal.id}/record',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
    );

    List<dynamic> list = response.data as List<dynamic>;
    print("${date.year}-0${date.day}-0${date.month}");
    for (int i = 0; i < list.length; i++) {
      if ("${date.year}-${date.month}-${date.day}" ==
          response.data[i]['date'].toString()) {
        caloric += response.data['amount'];
        print(caloric);
      }
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      return caloric;
    }
    return caloric;
  }
}
