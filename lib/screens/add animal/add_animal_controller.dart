import 'package:flutter/material.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';

class AddAnimalController with ChangeNotifier {
  AnimalModel animalModel = AnimalModel();

  void adicionarAnimal(userModel, context, name, weight, age) {
    animalModel.setAnimal(name, weight, age);
    notifyListeners();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(userModel, animalModel)));
  }
}
