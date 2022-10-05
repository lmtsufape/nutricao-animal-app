import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String? name;
  String? token;

  setUser(name, token) {
    this.name = name;
    this.token = token;
    notifyListeners();
  }

}
