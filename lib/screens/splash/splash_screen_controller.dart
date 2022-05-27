import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:thunderapp/screens/screens_index.dart';

class SplashScreenController {
  final BuildContext context;

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
      ///here we can put the logic that should be executed after the splash screen
      ///is shown for 3 seconds
      ///for example, we can go to the home screen after 3 seconds
      ///we can also use the following code to go to the home screen:
      ///Navigator.pushNamed(context, Screens.home);
      ///or we can use the following code to go to the sign in screen:
      ///Navigator.pushNamed(context, Screens.signin);
      await configDefaultAppSettings();
      Navigator.popAndPushNamed(context, Screens.signin);
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
}
