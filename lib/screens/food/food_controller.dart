import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';

class FoodController {
  late int userId;
  late String userToken;

  feedAnimal(type, food, quant) async {
    Dio _dio = Dio();
    final prefs = await SharedPreferences.getInstance();

    userId = prefs.getInt('id')!;
    userToken = prefs.getString('token')!;

    var response = await _dio.patch(
      kBaseUrl,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
      data: {},
    );
  }

  foodCalculate(type, food, quant) {
    /* A função é dada a cada 100 gramas, no caso
    se a pessoa alimentar com 100 gramas de algum certo alimento
    vai ser adicionado no animal um inteiro de 1 a 10 */

    double feed;
    if (type == 'Ração') {
      if (food == 'Golden') {
        feed = quant / 100;
        return feed;
      } else if (food == 'Pedigree') {
        feed = quant / 200;
        return feed;
      } else if (food == 'Royal Canin') {
        feed = quant / 150;
        return feed;
      }
    } else if (type == 'Frutas') {
      if (food == 'Banana') {
        feed = quant / 100;
        return feed;
      } else if (food == 'Maçã') {
        feed = quant / 150;
        return feed;
      } else if (food == 'Melancia') {
        feed = quant / 90;
        return feed;
      }
    } else if (type == 'Carnes') {
      if (food == 'Alcatra') {
        feed = quant / 60;
        return feed;
      } else if (food == 'Frango') {
        feed = quant / 50;
        return feed;
      } else if (food == 'Porco') {
        feed = quant / 70;
        return feed;
      }
    }
  }
}
