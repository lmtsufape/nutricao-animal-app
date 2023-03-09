import 'package:flutter/material.dart';

class AnimalModel extends ChangeNotifier {
  int id;
  String name;
  String sex;
  int activityLevel;
  bool isCastrated;
  DateTime? birth;
  String breed;
  String specie;
  String weight;
  String height;

  //String type;

  AnimalModel(
    this.id,
    this.name,
    this.sex,
    this.activityLevel,
    this.isCastrated,
    this.birth,
    this.breed,
    this.specie,
    this.weight,
    this.height,
    //this.type,
  );
  get getId => id;
  get getName => name;
  // get getType => type;
  get getSpecie => specie;
  get getWeight => weight;
  get getHeight => height;
  get getBirth => birth;
  get getSex => sex;

  void setId(int newId) {
    id = newId;
    notifyListeners();
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  // void setType(String newType) {
  //   type = newType;
  //   notifyListeners();
  // }

  void setSpecie(String newSpecie) {
    specie = newSpecie;
    notifyListeners();
  }

  void setWeight(String newWeight) {
    weight = newWeight;
    notifyListeners();
  }

  void setHeight(String newHeight) {
    height = newHeight;
    notifyListeners();
  }

  // void setBirth(DateTime? newBirth) {
  //   birth = newBirth;
  //   notifyListeners();
  // }

  void setSex(String newsex) {
    sex = newsex;
    notifyListeners();
  }
}
