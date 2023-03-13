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
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
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
                    height: heightScreen * 0.1,
                    width: widthScreen * 0.25,
                    child: FloatingActionButton(
                      heroTag: 'Add1',
                      backgroundColor: kSecondaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddAnimalScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: kBackgroundColor,
                        size: widthScreen * 0.14,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Animais Cadastrados',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: heightScreen * 0.030,
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
                  height: heightScreen * 0.1,
                  width: widthScreen * 0.25,
                  child: FloatingActionButton(
                    heroTag: 'Add2',
                    child: Icon(
                      Icons.add,
                      size: widthScreen * 0.14,
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
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
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
            child: SizedBox(
              height: heightScreen * 0.25,
              child: Card(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  color: Colors.greenAccent,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          color: Colors.pinkAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                   top: 5,
                                   right: 16,
                                 ),
                                 child: Text(
                                   //widget.age.toString(),
                                   "5",
                                   style:
                                       TextStyle(fontSize: heightScreen * kMediumSize, color: kBackgroundColor),
                                 ),
                               ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0, top: 5.0),
                                child: Text(
                                  widget.animal.sex.toString(),
                                  style: TextStyle(
                                      color: kBackgroundColor, fontSize: heightScreen * kMediumSize),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SizedBox(
                            width: widthScreen * 0.4,
                            child: Icon(Icons.add_a_photo, size: 80, color: kDetailColor,),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints.tightForFinite(width: double.infinity, height: double.infinity),
                          alignment: Alignment.topRight,
                          color: Colors.deepPurpleAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Container(
                                    color: kDetailColor,
                                    child: Text(
                                      widget.animal.name.toString(),
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: heightScreen * kLargeSize,
                                        color: kBackgroundColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Container(
                                  color: Colors.red,
                                  child: Text(
                                    //Trocar para widget.animal.breed quando arrumar API
                                    widget.animal.breed.toString(),
                                    style: TextStyle(
                                      fontSize: heightScreen * 0.017,
                                      color: kBackgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 10, 14.0, 8.0),
                          child: SizedBox(
                            width: widthScreen * 0.45,
                            height: heightScreen * 0.042,
                            child: ElevatedButton.icon(
                              style: style,
                              //exemplo
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FoodScreen(widget.animal.id))),
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 6, left: 0),
                                child: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: kBackgroundColor,
                                  size: widthScreen * 0.08,
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                              label: Center(
                                child: Text(
                                  'Alimentar',
                                  style: TextStyle(
                                      color: kBackgroundColor,
                                      fontSize: heightScreen * kMediumLargeSize,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            )),
      ),
    );
  }
}
