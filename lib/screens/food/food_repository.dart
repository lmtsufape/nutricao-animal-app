import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/food/food_controller.dart';

import '../../shared/constants/app_text_constants.dart';

class FoodRepository {
  late int userId;
  late String userToken;
  FoodController _controller = FoodController();
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
    /*Função de get para retornar os tipos de comidas cadastradas*/
    return types;
  }

  void feedAnimal(type, food, quant, animalId) async {
    Dio _dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await _dio.patch(
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
    print(response.statusCode);
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
