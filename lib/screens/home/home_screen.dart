import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/screens/screens_index.dart';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarCustom(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
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
          //Precisa de Animais cadastrados para funcionar
          /*ListView.builder(
        itemCount: widget._animals.length,
        itemBuilder: (context, index) {
          final animalIndex = widget._animals[index];
          return CardHomeScreen(animalIndex);
        },
        ),*/
          CardHomeScreen(),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  //final List<Animal> _animals = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class CardHomeScreen extends StatelessWidget {
  //final Animal _animal;

  //CardHomeScreen(this._animal);

  static const Color white = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFFF9800);

  static ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: orange,
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Screens.user),
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child:
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 105.0, left: 70.0),
                    child: Icon(Icons.add_photo_alternate_outlined),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(top: 110.0, left: 100.0),
                    child: Text(
                      'ANIMAL NAME',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(left: 100.0, bottom: 25),
                    child: Text(
                      'ANIMAL BREED',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 20.0, 12.0),
                      child: SizedBox(
                        width: 220,
                        height: 50,
                        child: ElevatedButton.icon(
                          style: style,
                          onPressed: () => Navigator.pushNamed(context, Screens.home),
                          icon: Icon(
                            Icons.restaurant_menu,
                            color: white,
                            size: 28.0,
                            textDirection: TextDirection.ltr,
                          ),
                          label: Text(
                            'Alimentar',
                            style: TextStyle(
                                color: white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                          /*child: Wrap(
                            children: [
                              Icon(Icons.restaurant, color: white, size: 24,),
                              Text('ALimentar', style: TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w800)),
                            ],
                          ),*/
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

/*class Animal{

  final String animalName;

  Animal(this.animalName);

  @override
  String toString() {
    return 'Animal{animalName: $animalName}';
  }
}*/
