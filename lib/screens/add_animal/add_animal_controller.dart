import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';

class AddAnimalController with ChangeNotifier {
  final AddAnimalRepository _repository = AddAnimalRepository();

  void adicionarAnimal(context, name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) {
    _repository.registerAnimal(name, specie, breed, sex, weight, height, age,
        isCastrated, activityLevel, context);
    notifyListeners();
  }

  String? setBreed(index, value) {
    String? breed;

    if (index == 1) {
      breed == value;
      return breed;
    }
    return null;
  }
}
