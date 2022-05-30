import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/signin/sign_in_model.dart';
import 'package:thunderapp/shared/core/api_client.dart';

enum SignInStatus {
  done,
  idle,
  loading,
  loaded,
  error,
}

class SignInController with ChangeNotifier {
  SignInStatus status = SignInStatus.idle;
  final ApiClient _apiClient = ApiClient();
  final BuildContext context;
  String? _email = '';
  String password = '';
  String get email => _email!;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  SignInController(this.context);
  signIn() {
    status = SignInStatus.loading;

    ///Use the functions to treat the data, make refinements and validation
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        email == 'atalias.herculys@gmail.com' &&
        password == '123456') {
      //wait for the future and then return the result
      _apiClient.signIn(email: email, password: password).then((response) {
        if (response != null) {
          status = SignInStatus.done;
          Navigator.pushNamed(context, Screens.home);
          notifyListeners();
        } else {
          //you should make a handler to treat this error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro ao fazer login, tente novamente.'),
            ),
          );
          status = SignInStatus.error;
          notifyListeners();
        }
      });
    } else {
      status = SignInStatus.error;
      notifyListeners();
    }
    notifyListeners();
  }
}
