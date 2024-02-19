import 'package:flutter/material.dart';
import 'package:thunderapp/screens/food/food_repository.dart';

import '../../shared/constants/style_constants.dart';

class FoodController {
  int feed = 0;

  void feedAnimal(type, food, quant, animal, context, addMenu) async {
    FoodRepository repository = FoodRepository();
    if (addMenu != null) {
      addMenu = true;
    } else {
      addMenu = false;
    }
    if (quant.text.isEmpty || type == 'Selecione' || food == 'Selecione') {
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
                  onPressed: () => repository.postMenu(
                      addMenu, type, food, quant, animal, context),
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

  /*foodCalculate(type, food, TextEditingController quant) {
    /* A função é dada a cada 100 gramas, no caso
    se a pessoa alimentar com 100 gramas de algum certo alimento
    vai ser adicionado no animal um inteiro de 1 a 10 */
    double quantDouble = double.parse(quant.text);
    if (type == 'Ração') {
      if (food == 'Golden') {
        feed = (quantDouble / 100).ceil();
        return feed;
      } else if (food == 'Pedigree') {
        feed = (quantDouble / 200).ceil();
        return feed;
      } else if (food == 'Royal Canin') {
        feed = (quantDouble / 150).ceil();
        return feed;
      }
    } else if (type == 'Frutas') {
      if (food == 'Banana') {
        feed = (quantDouble / 100).ceil();
        return feed;
      } else if (food == 'Maçã') {
        feed = (quantDouble / 150).ceil();
        return feed;
      } else if (food == 'Melancia') {
        feed = (quantDouble / 90).ceil();
        return feed;
      }
    } else if (type == 'Carnes') {
      if (food == 'Alcatra') {
        feed = (quantDouble / 60).ceil();
        return feed;
      } else if (food == 'Frango') {
        feed = (quantDouble / 50).ceil();
        return feed;
      } else if (food == 'Porco') {
        feed = (quantDouble / 70).ceil();
        return feed;
      }
    }
    //return 5;
  }*/
}
