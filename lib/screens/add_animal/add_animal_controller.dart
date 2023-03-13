import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thunderapp/image_controller/image_picker_controller.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';

class AddAnimalController with ChangeNotifier {
  final AddAnimalRepository _repository = AddAnimalRepository();
  final _imagePickerController = ImagePickerController();
  File? _selectedImage;
  String? _imagePath;
  bool hasImg = false;
  void adicionarAnimal(context, name, specie, breed, sex, weight, height, age,
      isCastrated, activityLevel) {
    _repository.registerAnimal(name, specie, breed, sex, weight, height, age,
        isCastrated, activityLevel, context);

    notifyListeners();
  }

  bool checkImg() {
    if (_selectedImage == null) {
      return false;
    }
    return true;
  }

  String? get imagePaths => _imagePath;

  File? get selectedImage => _selectedImage;

  set selectedImage(File? value) {
    _selectedImage = value;
    notifyListeners();
  }

  Future selectImageCam() async {
    File? file = await _imagePickerController.pickImageFromCamera();
    if (file != null) {
      _imagePath = file.path;
    } else {
      return null;
    }

    _selectedImage = file;
    notifyListeners();
  }

  Future selectImage() async {
    File? file = await _imagePickerController.pickImageFromGalery();
    if (file != null) {
      _imagePath = file.path;
    } else {
      return null;
    }

    _selectedImage = file;
    notifyListeners();
  }

  Future clearImg() async {
    _selectedImage = null;
    notifyListeners();
  }

  String? setBreed(index, value) {
    String? breed;

    if (index == 1) {
      breed == value;
      notifyListeners();
      return breed;
    }
    notifyListeners();
    return null;
  }
}
