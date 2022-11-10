import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnimalDetailsScreen extends StatelessWidget {
  const AnimalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context),
      drawer: NavigationDrawerWidget(),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [ Column(
          children: const [
            CardAnimal(),
          ],
        ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          child: const Icon(Icons.add, size: 50),
          onPressed: () => Navigator.pushNamed(context, Screens.addAnimal),
        ),
      ),
    );
  }
}

class CardAnimal extends StatelessWidget {

  const CardAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          width: 458,
          height: 655,
          child: Card(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 40, left: 50),
                    child: Icon(Icons.add_a_photo, size: 80, color: kBackgroundColor,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 105, top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Nome', style: TextStyle(color: kDetailColor, fontSize: kMediumSize),),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Johnny', style: TextStyle(color: kBackgroundColor, fontSize: kLargeSize, fontWeight: FontWeight.w900),),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 110),
                          child: Text('Raça', style: TextStyle(color: kDetailColor, fontSize: kMediumSize),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Sem raça definida', style: TextStyle(color: kBackgroundColor, fontSize: kLargeSize, fontWeight: FontWeight.w900),),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: FloatingActionButton(
                            backgroundColor: kDetailColor,
                            onPressed: () {},
                            child: Icon(Icons.menu_book_outlined, color: kBackgroundColor, size: 40,),),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () {},
                          child: Icon(Icons.restaurant_outlined, color: kBackgroundColor, size: 40,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: FloatingActionButton(
                            backgroundColor: kDetailColor,
                            onPressed: () {},
                            child: Icon(Icons.share, color: kBackgroundColor, size: 40,),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



