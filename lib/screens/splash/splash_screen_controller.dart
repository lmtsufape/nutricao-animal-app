import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign_in/sign_in_repository.dart';

class SplashScreenController {
  final BuildContext context;
  final _api = SignInRepository();
  SplashScreenController(this.context);
  final Logger _logger =
      Logger('Splash screen logger'); //a logger is always good to have

  ///this class is binded with SplashScreen widget and should be used
  /// to manage the startup logic of the app. ALL PRE LOAD DATA MUST BE HERE like the following:
  /// -- initialization of the app
  /// -- loading of the app
  /// -- getting startup data from the server
  /// -- setting and config startup data

  void initApplication() async {
    ///initialize the application
    /// DO put all startup logic in here, the startup logic should be returned by futures
    /// so we can await the setup while the app don't freeze

    Future.delayed(const Duration(seconds: 3), () async {
      if (await userHasToken()) {
        signIn(context);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.popAndPushNamed(context, Screens.addAnimal);
      }
    });
  }

  Future configDefaultAppSettings() async {
    _logger.config('Configuring default app settings...');
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _logger.fine('Default app settings configured!');
    return;
  }

  void signIn(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    _api.login(context, email!, password!).then((value) {
      if (value == true) {
        log('Successfully auto signed in');
        Navigator.pushNamed(context, Screens.home);
      } else {
        log('failed to log with email: $email and password: $password now going to sign in screen');
        Navigator.popAndPushNamed(context, Screens.signin);
      }
    });
  }

  Future<bool> userHasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final token = prefs.getString('token');
    if (token != null) {
      log('user has token');
      log(email!);
      log(token);
      return true;
    } else {
      log('user has no token');
      return false;
    }
  }
}
