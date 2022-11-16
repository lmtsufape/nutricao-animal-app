import 'package:flutter/material.dart';

class AnimalModel extends ChangeNotifier {
  final String? name;
  final String? weight;

  final String? age;

  AnimalModel(this.name, this.weight, this.age);
}
