import 'package:flutter/cupertino.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/signin/sign_in_model.dart';

enum SignInStatus {
  done,
  loading,
  loaded,
  error,
}

class SignInController with ChangeNotifier {
  final BuildContext context;
  String? _email = '';
  String password = '';
  String get email => _email!;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  SignInController(this.context);
  signIn(SignInModel model) {
    // if (model.email.isNotEmpty &&
    // model.password.isNotEmpty &&
    // email == 'atalias.herculys@gmail.com' &&
    // password == '123456') {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, Screens.home);
    });
  }
  // return null;
}
