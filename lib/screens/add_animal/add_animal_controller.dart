import 'package:flutter/material.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';

class AddAnimalController with ChangeNotifier {
  void adicionarAnimal( context, name, weight, age) {
    notifyListeners();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
