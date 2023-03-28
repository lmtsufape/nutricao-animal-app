import 'package:flutter/foundation.dart';

class FoodModel extends ChangeNotifier {
  String name;
  String category;
  double carbohydrates;
  double lipids;
  double calcium;
  double proteins;
  double fibers;

  FoodModel(
    this.name,
    this.category,
    this.carbohydrates,
    this.lipids,
    this.calcium,
    this.proteins,
    this.fibers,
  );

  get getName => name;
  get getCategory => category;
  get getCarbohydrates => carbohydrates;
  get getLipids => lipids;
  get getCalcium => calcium;
  get getProteins => proteins;
  get getFibers => fibers;
}
