import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';
import '../../shared/core/models/animal_model.dart';
import '../edit_animal/edit_animal_screen.dart';
import 'componets/caloric_need_counter.dart';
import 'componets/card_animal.dart';

// ignore: must_be_immutable
class AnimalDetailsScreen extends StatefulWidget {
  AnimalModel animal;

  AnimalDetailsScreen(
    this.animal, {
    Key? key,
  }) : super(key: key);

  @override
  State<AnimalDetailsScreen> createState() => _AnimalDetailsScreenState();
}

class _AnimalDetailsScreenState extends State<AnimalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // final AppTheme formCustom = AppTheme();
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              CardAnimal(widget.animal),
              CaloricNeedCounter(widget.animal.activityLevel, widget.animal),
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: heightScreen * 0.1,
        width: widthScreen * 0.25,
        child: FloatingActionButton(
          heroTag: 'Edit1',
          child: Icon(Icons.edit, size: widthScreen * 0.1),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditAnimalScreen(widget.animal))),
        ),
      ),
    );
  }
}
