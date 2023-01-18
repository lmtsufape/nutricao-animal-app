import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thunderapp/assets/index.dart';
import 'package:thunderapp/screens/splash/splash_screen_controller.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashScreenController _controller;
  @override
  void initState() {
    super.initState();
    _controller = SplashScreenController(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.initApplication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // Image.asset(Assets.logo),//* if you want to use some logo, uncomment this line and pass the path
            Text(
              'LOGO',
              style: TextStyle(fontSize: 78),
            ),
            SizedBox(
              height: kLargeSize,
            ),
            CircularProgressIndicator(
              color: kDetailColor,
              strokeWidth: kTinySize,
            ),
            SizedBox(
              height: kSmallSize,
            ),
            Text(
              'Carregando...',
              style: TextStyle(color: kBackgroundColor, fontSize: kLargeSize),
            )
          ],
        ),
      ),
    );
  }
}
