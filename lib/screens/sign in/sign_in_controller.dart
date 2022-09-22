import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'sign_in_repository.dart';

enum SignInStatus {
  done,
  error,
  loading,
  idle,
}

class SignInController with ChangeNotifier {
  final SignInRepository _repository = SignInRepository();
  String? email;
  String? password;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String? errorMessage;
  var status = SignInStatus.idle;
  void signIn(BuildContext context) async {
    try {
      var succ = await _repository.login(
          emailController.text, passwordController.text);
      if (succ) {
        status = SignInStatus.done;
        notifyListeners();
        Navigator.popAndPushNamed(context, Screens.home);
      }

      status = SignInStatus.done;
    } catch (e) {
      status = SignInStatus.error;
      setupErrorMessage(e.toString());
      notifyListeners();
    }
  }

  void setupErrorMessage(String value) async {
    errorMessage = value;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    errorMessage = null;
    notifyListeners();
  }
}
