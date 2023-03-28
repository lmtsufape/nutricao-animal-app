import 'package:flutter/foundation.dart';

class FoodModel extends ChangeNotifier {
  int id;
  String name;
  String category;
  String carbohydrates;
  String lipids;
  String calcium;
  String proteins;
  String fibers;

  FoodModel(
    this.id,
    this.name,
    this.category,
    this.carbohydrates,
    this.lipids,
    this.calcium,
    this.proteins,
    this.fibers,
  );

  get getId => id;
  get getName => name;
  get getCategory => category;
  get getCarbohydrates => carbohydrates;
  get getLipids => lipids;
  get getCalcium => calcium;
  get getProteins => proteins;
  get getFibers => fibers;
}
