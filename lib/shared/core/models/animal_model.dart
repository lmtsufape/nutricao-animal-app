import 'package:flutter/material.dart';

class AnimalModel extends ChangeNotifier {
  final String? name;

  final String? sex;

  AnimalModel(
    this.name,
    this.sex,
  );
}
