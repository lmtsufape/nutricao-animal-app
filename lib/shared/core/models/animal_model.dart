import 'package:flutter/material.dart';

class AnimalModel extends ChangeNotifier {
  int id;
  int activityLevel;
  bool isCastrated;
  String name;
  String type;
  String species;
  String weight;
  String height;
  //DateTime? birth;
  String sex;

  AnimalModel(
    this.id,
    this.activityLevel,
    this.isCastrated,
    this.weight,
    this.height,
    //this.birth,
    this.type,
    this.species,
    this.name,
    this.sex,
  );
  get getId => id;
  get getName => name;
  get getType => type;
  get getSpecies => species;
  get getWeight => weight;
  get getHeight => height;
  //get getBirth => birth;
  get getSex => sex;

  void setId(int newId) {
    id = newId;
    notifyListeners();
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setType(String newType) {
    type = newType;
    notifyListeners();
  }

  void setSpecies(String newSpecies) {
    species = newSpecies;
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
