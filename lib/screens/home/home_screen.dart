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
import '../../shared/constants/app_text_constants.dart';
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
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'Nenhum animal cadastrado',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: heightScreen * 0.030,
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
                            builder: (context) => AddAnimalScreen(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 16),
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
                            builder: (context) => AddAnimalScreen())),
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
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        alignment: Alignment.centerLeft);
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
              height: heightScreen * 0.24,
              child: Card(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: widthScreen * 0.46,
                              height: heightScreen * 0.21,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: widthScreen * 0.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: ClipRect(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          heightFactor: 0.78,
                                          child: Image(
                                            image: NetworkImage(
                                                '$kBaseUrl/image/${widget.animal.id}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: widthScreen * 0.48,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          //widget.age.toString(),
                                          "5 anos",
                                          style: TextStyle(
                                              fontSize:
                                                  heightScreen * kMediumSize,
                                              color: kBackgroundColor),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 100, right: 12),
                                          child: Text(
                                            widget.animal.sex.toString(),
                                            style: TextStyle(
                                                color: kBackgroundColor,
                                                fontSize:
                                                    heightScreen * kMediumSize),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: heightScreen * 0.025,
                                    color: Colors.transparent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      width: widthScreen * 0.40,
                                      //constraints: BoxConstraints.tightForFinite(width: double.maxFinite, height: double.maxFinite),
                                      child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          widget.animal.name.toString(),
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontSize: heightScreen * 0.028,
                                            color: kBackgroundColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      //Trocar para widget.animal.breed quando arrumar API
                                      widget.animal.breed.toString(),
                                      style: TextStyle(
                                        fontSize: heightScreen * 0.017,
                                        color: kBackgroundColor,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: heightScreen * 0.035,
                                    color: Colors.transparent,
                                  ),
                                  Container(
                                    width: widthScreen * 0.455,
                                    height: heightScreen * 0.042,
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton.icon(
                                      style: style,
                                      //exemplo
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FoodScreen(
                                                  widget.animal.id))),
                                      icon: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 6, left: 0),
                                        child: Icon(
                                          Icons.restaurant_menu,
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
                                              fontSize: heightScreen * 0.022,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )),
      ),
    );
  }
}
