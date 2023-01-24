import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:dio/dio.dart';

import '../../shared/components/dialogs/add_animal_dialog.dart';
import '../../shared/constants/style_constants.dart';

class AddAnimalRepository {
  late int userId;
  late String userToken;
  late int biometryId;
  late int animalId;

  Future<List<String>> getBreed(specie) async {
    Dio dio = Dio();
    int i;
    List<dynamic> all;
    List<String> breeds = [];
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    if (specie == 'dog') {
      var response = await dio.get('$kBaseUrl/users/breed/dog',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          ));
      all = response.data['breeds'];

      if (all.isNotEmpty) {
        for (i = 0; i < all.length; i++) {
          breeds.add(all[i]['name']);
        }
        if (kDebugMode) {
          print(breeds);
        }
        return breeds;
      }
    } else {
      var response = await dio.get('$kBaseUrl/users/breed/cat',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          ));
      all = response.data['breeds'];

      if (all.isNotEmpty) {
        for (i = 0; i < all.length; i++) {
          breeds.add(all[i]['name']);
        }
        if (kDebugMode) {
          print(breeds);
        }
        return breeds;
      }
    }

    return ['Falha'];
  }

  void registerAnimal(name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel, context) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    if (name.toString().isEmpty ||
        breed.toString().isEmpty ||
        weight.toString().isEmpty ||
        height.toString().isEmpty ||
        age.toString().isEmpty ||
        activityLevel.toString().isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Impossível cadastrar animal'),
                content: MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  color: kDetailColor,
                  child: const Text(
                    'Ok!',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                ),
              ));
    } else {
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
      showDialog(
          context: context, builder: (context) => const DialogAddAnimal());
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }

  Future<bool> deleteAnimal(idAnimal) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await dio.delete(
      '$kBaseUrl/users/$userId/animals/$idAnimal',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
    return true;
  }
}
