import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/food/food_controller.dart';

import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';


import '../../shared/constants/app_text_constants.dart';
import '../screens_index.dart';

class FoodRepository {
  late int userId;
  late String userToken;
  final FoodController _controller = FoodController();
  Map<String, List<String>> all = {
    'Ração': [
      'Golden',
      'Pedigree',
      'Royal Canin',
    ],
    'Frutas': [
      'Banana',
      'Maçã',
      'Melancia',
    ],
    'Carnes': [
      'Alcatra',
      'Frango',
      'Porco',
    ]
  };

  List<String> types = ['Ração', 'Frutas', 'Carnes'];
  List<String> foods = [];

  List<String> showTypes() {
    Dio _dio = Dio();

    return types;
  }

  void feedAnimal(
      type, food, TextEditingController quant, animalId, context) async {
    if (quant.text.isEmpty) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Preencha todos os campos'),
              content: MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  color: kDetailColor,
                  child: const Text(
                    'OK',
                    style: TextStyle(color: kBackgroundColor),
                  )),
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Deseja Alimentar seu Animal?'),
              content:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MaterialButton(
                  onPressed: () =>
                      editActivity(type, food, quant, animalId, context),
                  color: kDetailColor,
                  child: const Text(
                    'Sim',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  color: kDetailColor,
                  child: const Text(
                    'Não',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                )
              ]),
            );
          });
    }
  }

  editActivity(
      type, food, TextEditingController quant, animalId, context) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await dio.patch(
      '$kBaseUrl/users/$userId/animals/$animalId',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
      data: {"activity_level": _controller.feedCalculate(type, food, quant)},
    );
    if (response.statusCode == 200) {
      Navigator.popAndPushNamed(context, Screens.home);
    }
  }

  List<String> showFoods(type) {
    for (int i = 0; i < all.length; i++) {
      if (type == all.keys.toList()[i]) {
        foods = all[type]!;
      }
    }
    return foods;
  }
}
