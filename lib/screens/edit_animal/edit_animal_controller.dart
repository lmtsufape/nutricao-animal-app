import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/edit_animal/edit_animal_repository.dart';

import '../screens_index.dart';

class EditAnimalController with ChangeNotifier {
  final EditAnimalRepository _repository = EditAnimalRepository();

  logoff(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.popAndPushNamed(context, Screens.signin);
  }

  void editAnimal(
      animalId, nome, sex, castrated, weight, height, specie, context) async {
    if (nome.isEmpty && weight.text.isEmpty && height.text.isEmpty) {
      if (kDebugMode) {
        print('Preencha os campos para editar');
      }
    } else {
      var succ = await _repository.patchAnimal(animalId, nome, sex,
           castrated, weight, height, specie, context);
    }
  }
}
