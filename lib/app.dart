import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/edit_animal/edit_animal_screen.dart';
import 'package:thunderapp/screens/edit_profile/eidt_profile_screen.dart';
import 'package:thunderapp/screens/food/food_screen.dart';
import 'package:thunderapp/screens/no_reg_food/no_reg_food_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';

import 'package:thunderapp/screens/sign_in/sign_in_screen.dart';
import 'package:thunderapp/screens/sign_up/sign_up_screen.dart';
import 'package:thunderapp/screens/user%20screen/user_screen.dart';

import 'package:thunderapp/shared/constants/app_theme.dart';

import 'screens/home/home_screen.dart';

import 'screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        return DevicePreview.appBuilder(
            context,
            ResponsiveWrapper.builder(child,
                minWidth: 640,
                maxWidth: 1980,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.resize(768, name: TABLET),
                  ResponsiveBreakpoint.resize(1024, name: DESKTOP),
                ]));
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.getLightTheme(),
      routes: {
        Screens.splash: (BuildContext context) => const SplashScreen(),
        Screens.home: (BuildContext context) => HomeScreen(),
        Screens.signin: (BuildContext context) => const SignInScreen(),
        Screens.signup: (BuildContext context) => const SignUpScreen(),
        Screens.user: (BuildContext context) => const UserScreen(),
        Screens.addAnimal: (BuildContext context) => const AddAnimalScreen(),
        Screens.food: (BuildContext context) => const FoodScreen(),
        Screens.editAnimal: (BuildContext context) => const EditAnimalScreen(),
        Screens.noRegFood: (BuildContext context) => const NoRegFoodScreen(),
        Screens.editProfile: (BuildContext context) => const EditProfileScreen(),
      },
    );
  }
}
