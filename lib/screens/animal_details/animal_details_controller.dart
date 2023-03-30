import 'package:flutter/material.dart';

class AnimalDetailsController with ChangeNotifier {
  caloric(int? food, String specie, String breed) {
    if (food != null) {
      switch (specie) {
        case 'dog':
          switch (breed) {
            case 'Pastor Alemão':
              switch (food) {
                case 1:
                  return 10.toDouble();
                case 2:
                  return 20.toDouble();
                case 3:
                  return 30.toDouble();
                case 4:
                  return 40.toDouble();
                case 5:
                  return 45.toDouble();
                case 6:
                  return 50.toDouble();
                case 7:
                  return 55.toDouble();
                case 8:
                  return 65.toDouble();
                case 9:
                  return 75.toDouble();
                case 10:
                  return 95.toDouble();
              }
              notifyListeners();
              break;
            case 'Border Collie':
              switch (food) {
                case 1:
                  return 10.toDouble();
                case 2:
                  return 20.toDouble();
                case 3:
                  return 30.toDouble();
                case 4:
                  return 45.toDouble();
                case 5:
                  return 50.toDouble();
                case 6:
                  return 55.toDouble();
                case 7:
                  return 65.toDouble();
                case 8:
                  return 75.toDouble();
                case 9:
                  return 85.toDouble();
                case 10:
                  return 95.toDouble();
              }
              notifyListeners();
              break;
            case 'Myrtie Funk':
              switch (food) {
                case 1:
                  return 15.toDouble();
                case 2:
                  return 25.toDouble();
                case 3:
                  return 45.toDouble();
                case 4:
                  return 49.toDouble();
                case 5:
                  return 52.toDouble();
                case 6:
                  return 55.toDouble();
                case 7:
                  return 70.toDouble();
                case 8:
                  return 75.toDouble();
                case 9:
                  return 85.toDouble();
                case 10:
                  return 95.toDouble();
              }
              notifyListeners();
              break;
          }
          notifyListeners();
          break;
        case 'cat':
          switch (breed) {
            case 'Edythe Boyle':
              switch (food) {
                case 1:
                  return 10.toDouble();
                case 2:
                  return 20.toDouble();
                case 3:
                  return 30.toDouble();
                case 4:
                  return 45.toDouble();
                case 5:
                  return 50.toDouble();
                case 6:
                  return 55.toDouble();
                case 7:
                  return 65.toDouble();
                case 8:
                  return 75.toDouble();
                case 9:
                  return 85.toDouble();
                case 10:
                  return 95.toDouble();
              }
              notifyListeners();
              break;
            case 'Gladyce Oberbrunner':
              switch (food) {
                case 1:
                  return 10.toDouble();
                case 2:
                  return 20.toDouble();
                case 3:
                  return 30.toDouble();
                case 4:
                  return 40.toDouble();
                case 5:
                  return 50.toDouble();
                case 6:
                  return 60.toDouble();
                case 7:
                  return 70.toDouble();
                case 8:
                  return 80.toDouble();
                case 9:
                  return 90.toDouble();
                case 10:
                  return 100.toDouble();
              }
              notifyListeners();
              break;
            case 'Augustus Watsica':
              switch (food) {
                case 1:
                  return 10.toDouble();
                case 2:
                  return 20.toDouble();
                case 3:
                  return 30.toDouble();
                case 4:
                  return 40.toDouble();
                case 5:
                  return 48.toDouble();
                case 6:
                  return 55.toDouble();
                case 7:
                  return 70.toDouble();
                case 8:
                  return 80.toDouble();
                case 9:
                  return 90.toDouble();
                case 10:
                  return 100.toDouble();
              }
              notifyListeners();
              break;
          }
      }
    }
  }
}
