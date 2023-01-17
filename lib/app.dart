import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:nutricaoanimal/screens/add_animal/add_animal_screen.dart';
import 'package:nutricaoanimal/screens/animal_details/animal_details_screen.dart';
import 'package:nutricaoanimal/screens/edit_animal/edit_animal_screen.dart';
import 'package:nutricaoanimal/screens/edit_food/edit_food_screen.dart';
import 'package:nutricaoanimal/screens/edit_profile/edit_profile_screen.dart';
import 'package:nutricaoanimal/screens/animal/animal_screen.dart';
import 'package:nutricaoanimal/screens/food/food_screen.dart';
import 'package:nutricaoanimal/screens/food_details/food_details_screen.dart';
import 'package:nutricaoanimal/screens/no_reg_food/no_reg_food_screen.dart';
import 'package:nutricaoanimal/screens/private_menu/private_menu_screen.dart';
import 'package:nutricaoanimal/screens/screens_index.dart';
import 'package:nutricaoanimal/screens/share_tutoring/share_tutoring_screen.dart';
import 'package:nutricaoanimal/screens/sign_in/sign_in_screen.dart';
import 'package:nutricaoanimal/screens/sign_up/sign_up_screen.dart';
import 'package:nutricaoanimal/screens/user%20screen/user_screen.dart';
import 'package:nutricaoanimal/shared/constants/app_theme.dart';
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
        Screens.signin: (BuildContext context) => SignInScreen(),
        Screens.signup: (BuildContext context) => const SignUpScreen(),
        Screens.user: (BuildContext context) => const UserScreen(),
        Screens.food: (BuildContext context) => const FoodScreen(),
        Screens.editAnimal: (BuildContext context) => const EditAnimalScreen(),
        Screens.noRegFood: (BuildContext context) => const NoRegFoodScreen(),
        Screens.editProfile: (BuildContext context) =>
            const EditProfileScreen(),
        Screens.shareTutoring: (BuildContext context) =>
            const ShareTutoringScreen(),
        Screens.privateMenu: (BuildContext context) => PrivateMenuScreen(),
        Screens.editFood: (BuildContext context) => const EditFoodScreen(),
        Screens.foodDetails: (BuildContext context) =>
            const FoodDetailsScreen(),
        Screens.animalDetails: (BuildContext context) =>
            const AnimalDetailsScreen(),
        Screens.animal: (BuildContext context) => const AnimalScreen(),
        Screens.addAnimal: (BuildContext context) => const AddAnimalScreen(),
        Screens.home: (BuildContext context) => const HomeScreen(),
      },
    );
  }
}
