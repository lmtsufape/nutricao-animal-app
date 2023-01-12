import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';

class AddAnimalController with ChangeNotifier {
  final AddAnimalRepository _repository = AddAnimalRepository();

  void adicionarAnimal(context, name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) {
    _repository.registerAnimal(name, specie, breed, sex, weight, height, age,
        isCastrated, activityLevel);
    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
