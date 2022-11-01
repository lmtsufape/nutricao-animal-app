import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';
import '../../shared/core/models/user_model.dart';
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
  AnimalModel modelNull = AnimalModel();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String? errorMessage;
  var status = SignInStatus.idle;

  void signIn(BuildContext context, String email, String password) async {
    final UserModel userModel = Provider.of<UserModel>(context, listen: false);
    try {
      var succ = await _repository.login(
          context, emailController.text, passwordController.text, userModel);

      if (succ) {
        status = SignInStatus.done;
        notifyListeners();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  HomeScreen(userModel, modelNull)));
      }
      status = SignInStatus.done;
    } catch (e) {
      print('SALVE');
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
