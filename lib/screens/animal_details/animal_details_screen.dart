import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:thunderapp/main.dart';
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
      appBar: AppBar(),
      drawer: NavigationDrawerWidget(),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Column(
            children: const [
              CardAnimal(),
              //CaloricNeedCounter(),
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          child: const Icon(Icons.edit, size: 50),
          onPressed: () => Navigator.pushNamed(context, Screens.editAnimal),
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
        padding: const EdgeInsets.all(12),
        child: Card(
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.add_a_photo,
                  size: 80,
                  color: kBackgroundColor,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 65),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Nome',
                        style: TextStyle(
                          color: kDetailColor,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Johnny Cash',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'Raça',
                          style: TextStyle(color: kDetailColor, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        'Pastor Alemão',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () {},
                          child: const Icon(
                            Icons.menu_book_outlined,
                            color: kBackgroundColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () {},
                          child: const Icon(
                            Icons.restaurant_outlined,
                            color: kBackgroundColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 20),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () {},
                          child: const Icon(
                            Icons.share,
                            color: kBackgroundColor,
                            size: 40,
                          ),
                        ),
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
    );
  }
}

class StaggeredGridAnimal extends StatelessWidget {
  const StaggeredGridAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Card(
        color: kBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
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
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: 'Espécie: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Gato',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: 'Idade: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: '3 anos',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: 'Sexo: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masculino',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.6,
              child: ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: kPrimaryColor,
                        width: 3.5,
                        strokeAlign: StrokeAlign.outside),
                  ),
                  title: RichText(
                    text: const TextSpan(
                      text: 'Peso: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                          fontSize: 23),
                      children: <TextSpan>[
                        TextSpan(
                          text: '4,6Kg',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                              fontSize: 21),
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 0, top: 5, left: 2),
                    child: SizedBox(
                      height: 50,
                      width: 46,
                      child: FloatingActionButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Screens.weightHistory),
                        backgroundColor: kDetailColor,
                        child: const Icon(
                          Icons.area_chart_outlined,
                          color: kBackgroundColor,
                          size: 35,
                        ),
                      ),
                    ),
                  )),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: 'Altura: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: '38cm',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: 'Castrado: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sim',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
                ),
                title: RichText(
                  text: const TextSpan(
                    text: 'Nível de atividade: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Ativo',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


