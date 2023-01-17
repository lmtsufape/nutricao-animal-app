import 'package:flutter/material.dart';
import 'package:nutricaoanimal/screens/add_animal/add_animal_repository.dart';
import 'package:nutricaoanimal/screens/home/home_screen.dart';

class AddAnimalController with ChangeNotifier {
  final AddAnimalRepository _repository = AddAnimalRepository();

  void adicionarAnimal(context, name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) {
    _repository.registerAnimal(name, specie, breed, sex, weight, height, age,
        isCastrated, activityLevel);
    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  String? setBreed(index, value) {
    String? breed;

    if (index == 1) {
      breed == value;
      return breed;
    }
    return null;
  }

  /*List<String> showBreeds(String specie) {
    var breeds = _repository.getBreed(specie);
    
    breeds.then(
      (value) {
        return value;
      },
    );

    return ['Falha'];
  }*/

  List<String> showBreeds(specie) {
    List<String> breedsDog = [
      'pastor alemão',
      'Border Collie',
      'Myrtie Funk',
    ];
    List<String> breedsCat = [
      'Edythe Boyle',
      'Gladyce Oberbrunner',
      'Augustus Watsica'
    ];

    if (specie == 'dog') {
      return breedsDog;
    } else {
      return breedsCat;
    }
  }
}
