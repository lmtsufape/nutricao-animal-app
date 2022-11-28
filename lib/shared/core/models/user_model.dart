import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String? name;
  String? token;
  String? email;

  setUser(name, token, email) {
    this.name = name;
    this.token = token;
    this.email = email;
    notifyListeners();
  }

  getName() {
    return this.name;
  }

  getToken() {
    return this.token;
  }

  getEmail() {
    return this.email;
  }
}
