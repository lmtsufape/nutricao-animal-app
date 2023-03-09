import 'package:flutter/material.dart';
import 'package:thunderapp/screens/splash/splash_screen_controller.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/assets/index.dart';

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
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(Assets.logo, width: widthScreen * 1.2,),

            SizedBox(
              height: heightScreen * kLargeSize,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: CircularProgressIndicator(
                color: kDetailColor,
                strokeWidth: 8,
              ),
            ),
            SizedBox(
              height: heightScreen * kMediumSize,
            ),
            Text(
              'Carregando...',
              style: TextStyle(color: kBackgroundColor, fontSize: heightScreen * kLargeSize),
            )
          ],
        ),
      ),
    );
  }
}
