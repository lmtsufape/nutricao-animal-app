import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/animal_details/animal_details_screen.dart';
import 'package:thunderapp/screens/food/food_screen.dart';
import 'package:thunderapp/screens/sign_in/sign_in_controller.dart';
import 'package:thunderapp/screens/user%20screen/user_screen_controller.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';
import '../../shared/core/models/user_model.dart';
import '../add_animal/add_animal_screen.dart';
import 'home_screen_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final SignInController newController = SignInController();
  late Future getAnimals;
  late AnimalModel animal;
  final repository = HomeScreenRepository();
  final UserModel user = UserModel();
  late String userName;
  late String email;

  @override
  void initState() {
    super.initState();
    _getUserName();
    _getEmail();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    getAnimals = repository.getAnimalData(context);
    super.didChangeDependencies();

    _getUserName();
  }

  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name')!;
    return userName;
  }

  Future<String> _getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')!;
    return email;
  }

  final AppTheme formCustom = AppTheme();
  final UserScreenController controller = UserScreenController();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return FutureBuilder(
          future: getAnimals,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final dataAnimals = snapshot.data as List;
              if (dataAnimals.isEmpty) {
                return Scaffold(
                  backgroundColor: kBackgroundColor,
                  appBar: formCustom.appBarCustom(context, _getUserName()),
                  drawer: NavigationDrawerWidget(userName, email),
                  body: Center(
                    child: Column(
                      children: const [
                        Padding(
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
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            'Nenhum animal cadastrado',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: SizedBox(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      heroTag: 'Add1',
                      backgroundColor: kPrimaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAnimalScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: kBackgroundColor,
                        size: 50,
                      ),
                    ),
                  ),
                );
              }
              return Scaffold(
                backgroundColor: kBackgroundColor,
                appBar: formCustom.appBarCustom(context, _getUserName()),
                drawer: NavigationDrawerWidget(userName, email),
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
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            animal = AnimalModel(
                                dataAnimals[index]['id'],
                                dataAnimals[index]['name'],
                                dataAnimals[index]['sex'],
                                dataAnimals[index]['activity_level'],
                                dataAnimals[index]['is_castrated'],
                                dataAnimals[index]['birthDate'],
                                dataAnimals[index]['breed'],
                                dataAnimals[index]['specie'],
                                dataAnimals[index]['weight'],
                                dataAnimals[index]['height']);

                            return CardHomeScreen(animal);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: dataAnimals.length),
                    )
                  ],
                ),
                floatingActionButton: SizedBox(
                  height: 100,
                  width: 100,
                  child: FloatingActionButton(
                    heroTag: 'Add2',
                    child: const Icon(
                      Icons.add,
                      size: 65,
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddAnimalScreen())),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class CardHomeScreen extends StatefulWidget {
  AnimalModel animal;

  CardHomeScreen(this.animal, {super.key});

  @override
  State<CardHomeScreen> createState() => _CardHomeScreenState();
}

class _CardHomeScreenState extends State<CardHomeScreen> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: kDetailColor,
        textStyle: const TextStyle(fontSize: kMediumSize),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)));
    return InkWell(
      //exemplo
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimalDetailsScreen(widget.animal);
      })),
      child: Ink(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 100.0, left: 80.0),
                    child: Icon(Icons.add_photo_alternate_outlined),
                  ),
                  title: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 24,
                      //     right: 16,
                      //   ),
                      //   child: Text(
                      //     widget.age.toString(),
                      //     style:
                      //         TextStyle(fontSize: 15, color: kBackgroundColor),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17.0, left: 47.0),
                        child: Text(
                          widget.animal.name.toString(),
                          style: const TextStyle(
                              fontSize: 35.0,
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 85.0, bottom: 25),
                    child: Text(
                      //Trocar para widget.animal.breed quando arrumar API
                      widget.animal.breed.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: kBackgroundColor,
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                    child: Text(
                      widget.animal.sex.toString(),
                      style: const TextStyle(
                          color: kBackgroundColor, fontSize: 15.0),
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
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FoodScreen(widget.animal.id))),
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
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
