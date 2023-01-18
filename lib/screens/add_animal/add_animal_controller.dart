import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';
import 'package:thunderapp/screens/home/home_screen.dart';

class AddAnimalController with ChangeNotifier {
  final AddAnimalRepository _repository = AddAnimalRepository();

  void adicionarAnimal(context, name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) {
    _repository.registerAnimal(name, specie, breed, sex, weight, height, age,
        isCastrated, activityLevel);
    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
    var breeds = _repository.getBreed(specie).then((value) => value);

    return ['Falha'];
  }*/

  List<String> showBreeds(specie) {
    List<Map<String, dynamic>> dogMap = [
      {
        'breed': 'pastor alemão',
        'enoughFood': 5,
      },
      {
        'breed': 'Border Collie',
        'enoughFood': 6,
      },
      {
        'breed': 'Myrtie Funk',
        'enoughFood': 4,
      }
    ];
    List<Map<String, dynamic>> catMap = [
      {
        'breed': 'Edythe Boyle',
        'enoughFood': 5,
      },
      {
        'breed': 'Gladyce Oberbrunner',
        'enoughFood': 6,
      },
      {
        'breed': 'Augustus Watsica',
        'enoughFood': 4,
      }
    ];
    List<String> dogBreeds = [];
    List<String> catBreeds = [];
    int i;

    if (specie == 'dog') {
      for (i = 0; i < dogMap.length; i++) {
        dogBreeds.add(dogMap[i]['breed']);
      }
      return dogBreeds;
    } else {
      for (i = 0; i < catMap.length; i++) {
        catBreeds.add(catMap[i]['breed']);
      }
      return catBreeds;
    }
  }
}
