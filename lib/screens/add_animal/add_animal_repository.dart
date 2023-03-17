import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:dio/dio.dart';
import '../../shared/components/dialogs/add_animal_dialog.dart';
import '../../shared/constants/style_constants.dart';

class AddAnimalRepository with ChangeNotifier {
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
      var response = await dio.get('$kBaseUrl/users/breed/Cachorro',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          ));
      all = response.data['breeds'];
      notifyListeners();

      if (all.isNotEmpty) {
        for (i = 0; i < all.length; i++) {
          breeds.add(all[i]['name']);
        }
        notifyListeners();
        return breeds;
      }
    } else {
      var response = await dio.get('$kBaseUrl/users/breed/Gato',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          ));
      all = response.data['breeds'];
      notifyListeners();

      if (all.isNotEmpty) {
        for (i = 0; i < all.length; i++) {
          breeds.add(all[i]['name']);
        }
        notifyListeners();
        return breeds;
      }
    }
    notifyListeners();
    return ['Falha'];
  }

  void registerAnimal(name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel, imgPath, context) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    if (name.toString().isEmpty ||
        breed.toString().isEmpty ||
        weight.toString().isEmpty ||
        height.toString().isEmpty ||
        age.toString().isEmpty ||
        activityLevel.toString().isEmpty ||
        imgPath == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Impossível cadastrar animal'),
                content: MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  color: kDetailColor,
                  child: const Text(
                    'Ok!',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                ),
              ));
    } else {
      final body = FormData.fromMap({
        "name": name.toString(),
        "sex": sex.toString(),
        "is_castrated": isCastrated,
        "activity_level": activityLevel,
        "weight": weight.toString(),
        "height": height.toString(),
        "breed": breed.toString(),
        "image": await MultipartFile.fromFile(imgPath.toString(),
            filename: "image.jpg"),
      });
      try {
        var response = await dio.post(
          '$kBaseUrl/users/$userId/animals/complete',
          options: Options(
            headers: {
              "Content-Type": "multipart/form-data",
              "Authorization": "Bearer $userToken"
            },
          ),
          data: body,
        );
        showDialog(
            context: context, builder: (context) => const DialogAddAnimal());
        notifyListeners();
        if (kDebugMode) {
          print(response.statusCode);
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Impossível cadastrar animal'),
                  content: MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    color: kDetailColor,
                    child: const Text(
                      'Ok!',
                      style: TextStyle(color: kBackgroundColor),
                    ),
                  ),
                ));
      }
    }
    notifyListeners();
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
    notifyListeners();
    return true;
  }
}
