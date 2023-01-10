import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';

class AddAnimalController with ChangeNotifier {
  final AddAnimalRepository _repository = AddAnimalRepository();

  void adicionarAnimal(context, name, weight, age) {
    _repository.registerAnimal();
    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
