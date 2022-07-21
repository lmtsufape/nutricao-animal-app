
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
var status = SignInStatus.idle;
  void signIn(BuildContext context) async{
    try {
      _repository.signIn(
        email: email!,
        password: password!,
        onSuccess: (){
          print('success');
          // status = SignInStatus.done;
          // notifyListeners();
          // Navigator.pushNamed(context, Screens.home);
        },
      );
      status = SignInStatus.done;
    } catch (e) {
      status = SignInStatus.error;
    }
  }
}
