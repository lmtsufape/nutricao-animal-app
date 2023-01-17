import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String? name;
  String? token;
  String? email;

  UserModel({this.name, this.token, this.email});

  setUser(name, token, email) {
    this.name = name;
    this.token = token;
    this.email = email;
    notifyListeners();
  }

  getName() {
    return name;
  }

  getToken() {
    return token;
  }

  getEmail() {
    return email;
  }
}
