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
          height: 671,
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
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: StaggeredGridAnimal(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StaggeredGridAnimal extends StatelessWidget {
  const StaggeredGridAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 448,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Card(
          color: kBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Espécie: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text: 'Gato', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Idade: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text:'3 anos', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                    ),
                  ),
                ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Sexo: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text:'Masculino', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Peso: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text:'4,6Kg', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 0, top: 5),
                    child: SizedBox(
                      height: 50,
                      width: 46,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: kDetailColor,
                        child: Icon(Icons.ssid_chart_sharp, color: kBackgroundColor,),
                      ),
                    ),
                  )
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Altura: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text:'38cm', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Castrado: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text:'Sim', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 0.6,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 3.5, strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Nível de atividade: ',
                      style: TextStyle(fontWeight: FontWeight.w600, color: kSecondaryColor, fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(text:'Ativo', style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 23),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




