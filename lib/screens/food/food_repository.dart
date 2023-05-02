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
import '../../shared/core/models/animal_model.dart';
import '../screens_index.dart';

class FoodRepository {
  late int userId;
  late String userToken;
  final FoodController _controller = FoodController();
  FoodModel? usedFood;

  Future<List<FoodModel>> populateListFoods() async {
    Dio _dio = Dio();

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

        /*compare = (response.data[i]["category"]);
        if (categories.any((element) => element == compare) == false) {
          categories.add(compare);
        }*/
      }
    }
    return foodListComplete;
  }

  Future<List<String>> showCategories() async {
    List<String> categories = [];
    List<FoodModel> list = await populateListFoods();
    String compare;
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        compare = (list[i].category);
        if (categories.any((element) => element == compare) == false) {
          categories.add(compare);
        }
      }

      return categories;
    }

    return [];
  }

  Future<List<String>> showFoods(type) async {
    List<String> foods = [];
    List<FoodModel> list = await populateListFoods();

    int i;

    for (i = 0; i < list.length; i++) {
      if (list[i].category == type) {
        foods.add(list[i].name);
      }
    }
    return foods;
  }

  void getFood(int id) {
    late FoodModel aux;
    int i;
    /*for (i = 0; i < foodListComplete.length; i++) {
      if (id == foodListComplete[i].id) {
        aux = foodListComplete[i];
      }
    }*/
    // print(aux.carbohydrates);
    //return ;
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
      menu.add(data[i]['name']);
    }
    return menu;
  }

  Future<bool> postMenu(bool addMenu, type, food, TextEditingController quant,
      AnimalModel animal, context) async {
    Dio _dio = Dio();
    List<FoodModel> list = await populateListFoods();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    FoodModel? foodModel;
    print(list);

    for (int i = 0; i < list.length; i++) {
      if (food == list[i].name && type == list[i].category) {
        foodModel = list[i];
      }
    }

    if (foodModel != null) {
      double carbohydrates = double.parse(foodModel.carbohydrates);
      double proteins = double.parse(foodModel.proteins);
      double lipids = double.parse(foodModel.lipids);

      double amount = carbohydrates * 4 + proteins * 4 + lipids * 9;

      var response = await _dio.post(
        '$kBaseUrl/users/$userId/animals/${animal.id}/menu/snack',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $userToken"
          },
        ),
        data: {
          "category": type.toString(),
          "name": food.toString(),
          "animal_id": animal.id,
          "amount": amount,
        },
      );

      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pushNamed(context, Screens.home);
        return true;
      } else {
        return false;
      }
    }
    print("nao entrou");
    return false;
  }

  void feedAnimal(type, food, quant, AnimalModel animal) async {
    Dio _dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    FoodModel? foodModel;

    /*for (int i = 0; i < foodListComplete.length; i++) {
      if (food == foodListComplete[i].name &&
          type == foodListComplete[i].category) {
        foodModel = foodListComplete[i];
      }
    }*/

    if (foodModel != null) {
      double carbohydrates = double.parse(foodModel.carbohydrates);
      double proteins = double.parse(foodModel.proteins);
      double lipids = double.parse(foodModel.lipids);

      double amount = carbohydrates * 4 + proteins * 4 + lipids * 9;
      userToken = prefs.getString('token')!;

      var response = await _dio.post(
        '$kBaseUrl/users/$userId/animals/${animal.id}/record',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $userToken"
          },
        ),
        data: {
          "amount": amount.toString(),
          "animal_id": animal.id.toString(),
          "food_id": foodModel.id.toString()
        },
      );
      print(response.statusCode);
    }
  }
}
