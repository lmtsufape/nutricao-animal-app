import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign_in/sign_in_controller.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import '../../shared/core/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  UserModel userModel = UserModel();
  HomeScreen(this.userModel, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppTheme formCustom = AppTheme();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignInController>(
              create: (BuildContext context) {
            return SignInController();
          }),
          ChangeNotifierProvider<UserModel>.value(value: widget.userModel),
        ],
        builder: (context, child) {
          return Consumer<UserModel>(builder: (context, userModel, child) {
            return Scaffold(
              backgroundColor: kBackgroundColor,
              appBar: formCustom.appBarCustom(
                  context, widget.userModel.name.toString()),
              body: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Animais Cadastrados',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  CardHomeScreen(),
                ],
              ),
              floatingActionButton: SizedBox(
                height: 100,
                width: 100,
                child: FloatingActionButton(
                  child: const Icon(
                    Icons.add,
                    size: 65,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, Screens.addAnimal),
                ),
              ),
            );
          });
        });
  }
}

class CardHomeScreen extends StatelessWidget {
  static ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: kDetailColor,
      textStyle: const TextStyle(fontSize: kMediumSize),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //exemplo
      onTap: () => Navigator.pushNamed(context, Screens.user),
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 100.0, left: 80.0),
                    child: Icon(Icons.add_photo_alternate_outlined),
                  ),
                  title: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          right: 16,
                        ),
                        child: Text(
                          'AGE',
                          style:
                              TextStyle(fontSize: 15, color: kBackgroundColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 17.0, left: 47.0),
                        child: Text(
                          'NAME',
                          style: TextStyle(
                              fontSize: 35.0,
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.only(left: 85.0, bottom: 25),
                    child: Text(
                      'BREED',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kBackgroundColor,
                      ),
                    ),
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.only(right: 10.0, top: 10.0),
                    child: Text(
                      'WEIGHT',
                      style: TextStyle(color: kBackgroundColor, fontSize: 15.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 20.0, 22.0),
                      child: SizedBox(
                        width: 215,
                        height: 50,
                        child: ElevatedButton.icon(
                          style: style,
                          //exemplo
                          onPressed: () =>
                              Navigator.pushNamed(context, Screens.food),
                          icon: const Icon(
                            Icons.restaurant_menu,
                            color: kBackgroundColor,
                            size: 28.0,
                            textDirection: TextDirection.ltr,
                          ),
                          label: const Text(
                            'Alimentar',
                            style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
