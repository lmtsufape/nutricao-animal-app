import 'package:flutter/material.dart';

class AnimalModel extends ChangeNotifier {
  final String? name;
  final String? specie;
  final String? breed;
  final String? sex;
  final String? weight;
  final String? height;
  final String? age;
  final String? isCastraded;
  final String? activity;

  AnimalModel(this.name, this.weight, this.age, this.specie, this.breed,
      this.sex, this.height, this.isCastraded, this.activity);
}
