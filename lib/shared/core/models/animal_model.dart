import 'package:flutter/material.dart';

class AnimalModel extends ChangeNotifier {
  String? name;
  String? weight;

  String? age;

  setAnimal(name, weight, age) {
    this.name = name;
    this.weight = weight;
    this.age = age;
    notifyListeners();
  }
}
