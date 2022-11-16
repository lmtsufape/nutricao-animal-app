import 'package:flutter/cupertino.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';

class HomeScreenController with ChangeNotifier {
  List<AnimalModel> _animals = [];
  List<AnimalModel> get animals => _animals;

  final List<Map<String, dynamic>> _fakeData = [
    {
      'name': 'Glow',
      'age': '4',
      'weight': '1',
    },
    {
      'name': 'Caio',
      'age': '6',
      'weight': '1',
    },
    {
      'name': 'Atalias',
      'age': '5',
      'weight': '1',
    }
  ];

  void populateList() {
    for (var i = 0; i < _fakeData.length; i++) {
      _animals.add(AnimalModel(
          _fakeData[i]['name'], _fakeData[i]['weight'], _fakeData[i]['age']));
    }
  }
}
