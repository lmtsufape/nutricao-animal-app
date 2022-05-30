import 'package:flutter/cupertino.dart';

class SelectedItem with ChangeNotifier {
  String title = '';

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }
}
