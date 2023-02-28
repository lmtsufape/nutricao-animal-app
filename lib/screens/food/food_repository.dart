import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  // List<String> types = ['Ração', 'Frutas', 'Carnes'];
  List<String> foods = [];

// ############################################################################
  /*Função abaixo usada para pegar as categorias de comidas direto da api e transformar em Lista, 
  para usar retire o comentário e renomeie as variáveis, após isso coloque nos respectivos lugares na
  food_screen */

  Future<List<String>> showTypes() async {
    Dio _dio = Dio();
    List<String> categories = [];

    int i;
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await _dio.get(
      '$kBaseUrl/foods',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
    );
    var all = response.data as List<dynamic>;
    String compare;
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (i = 0; i < all.length; i++) {
        compare = (response.data[i]["category"]);
        if (categories.any((element) => element == compare) == false) {
          categories.add(compare);
        }
      }
    }

    return categories;
  }

  

  editActivity(type, food, TextEditingController quant, animalId, context,
      addMenu) async {
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

  void postMenu() {}
}
