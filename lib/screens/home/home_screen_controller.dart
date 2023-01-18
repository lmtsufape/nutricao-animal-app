import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
import 'package:thunderapp/screens/home/home_screen_repository.dart';
import 'package:nutricaoanimal/shared/core/models/animal_model.dart';
=======
import 'package:thunderapp/shared/core/models/animal_model.dart';
>>>>>>> parent of 3e925e9 (Refatoração no nome do projeto de todas as dependencias)

class HomeScreenController extends ChangeNotifier {
  final List<AnimalModel> _animals = [];
  late Future<List<dynamic>> animalData;
  List<AnimalModel> get animals => _animals;
  final HomeScreenRepository _repository = HomeScreenRepository();

  void populateList() async {
    animalData = _repository.getAnimalData();
    animalData.then((value) {
      if (value.isNotEmpty) {
        for (var i = 0; i < value.length; i++) {
          _animals.add(AnimalModel(value[i]['name'], value[i]['sex']));
        }
      }
      notifyListeners();
    });
  }
}
