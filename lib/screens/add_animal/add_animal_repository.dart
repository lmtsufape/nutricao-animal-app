import 'package:shared_preferences/shared_preferences.dart';
import 'package:nutricaoanimal/shared/constants/app_text_constants.dart';
import 'package:dio/dio.dart';


class AddAnimalRepository {
  late int userId;
  late String userToken;

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
        return breeds;
      }
    }

    return [];
  }

  Future<bool> registerAnimal(name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) async {
    Dio dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

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
    print(response.statusCode);

    return true;
  }
}
