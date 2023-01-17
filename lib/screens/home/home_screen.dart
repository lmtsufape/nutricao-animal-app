import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nutricaoanimal/screens/screens_index.dart';
import 'package:nutricaoanimal/screens/sign_in/sign_in_controller.dart';
import 'package:nutricaoanimal/shared/constants/app_number_constants.dart';
import 'package:nutricaoanimal/shared/constants/app_theme.dart';
import 'package:nutricaoanimal/shared/constants/style_constants.dart';
import '../../shared/core/models/user_model.dart';
import '../add_animal/add_animal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final SignInController newController = SignInController();
  late HomeScreenController _controller;
  final UserModel user = UserModel();
  late String UserName;
  bool _listPopulated = false;

  @override
  void initState() {
    super.initState();
    _getUserName();

    WidgetsBinding.instance.addObserver(this);
  }

  void _isListed() {
    setState(() {
      _listPopulated = true;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getUserName();
  }

  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    UserName = prefs.getString('name')!;
    return UserName;
  }

  final AppTheme formCustom = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenController>(
          create: (context) {
            return HomeScreenController();
          },
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          _controller = Provider.of<HomeScreenController>(context);
          if (!_listPopulated) {
            _controller.populateList();
            _isListed();
          }

          return Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: formCustom.appBarCustom(context, _getUserName()),
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
                        return CardHomeScreen(_controller.animals[index].name,
                            _controller.animals[index].sex);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: _controller.animals.length),
                )
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddAnimalScreen())),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardHomeScreen extends StatefulWidget {
  String? name;
  String? sex;

  CardHomeScreen(this.name, this.sex, {super.key});

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
      onTap: () => Navigator.pushNamed(context, Screens.animalDetails),
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
                        padding: EdgeInsets.only(top: 17.0, left: 47.0),
                        child: Text(
                          widget.name.toString(),
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
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 10.0, top: 10.0),
                    child: Text(
                      widget.sex.toString(),
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
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
