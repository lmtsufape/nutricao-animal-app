import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/food/food_repository.dart';

import '../../shared/constants/style_constants.dart';

class FoodController {
  int feed = 0;
  //final FoodRepository _repository = FoodRepository();

  void feedAnimal(type, food, TextEditingController quant, animalId, context,
      addMenu) async {
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
                  onPressed: () => {},
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
}
