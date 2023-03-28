import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/food/food_controller.dart';

import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/food_model.dart';

import '../../shared/constants/app_text_constants.dart';
import '../screens_index.dart';

class FoodRepository {
  late int userId;
  late String userToken;
  final FoodController _controller = FoodController();

  Future<List<String>> showTypes() async {
    Dio _dio = Dio();
    List<String> categories = [];
    List<FoodModel> foodListComplete = [];

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
    //print(response.data);
    var all = response.data as List<dynamic>;
    String compare;
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (i = 0; i < all.length; i++) {
        foodListComplete.add(
          FoodModel(
            response.data[i]["id"],
            response.data[i]["name"],
            response.data[i]["category"],
            response.data[i]["carbohydrates"],
            response.data[i]["lipids"],
            response.data[i]["calcium"],
            response.data[i]["protein_value"],
            response.data[i]["fiber"],
          ),
        );

        compare = (response.data[i]["category"]);
        if (categories.any((element) => element == compare) == false) {
          categories.add(compare);
        }
      }
    }
    return categories;
  }

  Future<List<String>> showFoods(type) async {
    Dio _dio = Dio();
    List<String> foods = [];

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

    var data = response.data as List<dynamic>;

    for (i = 0; i < data.length; i++) {
      if (response.data[i]['category'] == type) {
        foods.add(response.data[i]['name']);
      }
    }
    return foods;
  }

  Future<List<String>> showMenu(animalId) async {
    Dio _dio = Dio();
    List<String> menu = [];

    int i;
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await _dio.get(
      '$kBaseUrl/users/$userId/animals/$animalId/menu',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
    );
    print(response.statusCode);
    var data = response.data['menu'] as List<dynamic>;

    for (i = 0; i < data.length; i++) {
      menu.add(response.data[i]['name']);
    }
    return menu;
  }

  Future<bool> postMenu(
      bool addMenu, type, food, TextEditingController quant, animalId) async {
    if (addMenu) {
      Dio _dio = Dio();

      final prefs = await SharedPreferences.getInstance();

      userId = prefs.getInt('id')!;
      userToken = prefs.getString('token')!;

      int aux = int.parse(quant.text);

      var response = await _dio.post(
        '$kBaseUrl/users/$userId/animals/$animalId/menu/snack',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $userToken"
          },
        ),
        data: {
          "category": type,
          "name": food,
          "amount": aux,
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
