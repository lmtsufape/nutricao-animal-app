import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';
import 'componets/caloric_need_counter.dart';
import 'componets/card_animal.dart';

// ignore: must_be_immutable
class AnimalDetailsScreen extends StatefulWidget {
  int id;
  String name;
  String sex;
  int activityLevel;
  AnimalDetailsScreen(
    this.id,
    this.name,
    this.sex,
    this.activityLevel, {
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
      appBar: AppBar(
        actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.user),
        ),
      ]),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              CardAnimal(
                  widget.id, widget.name, widget.sex, widget.activityLevel),
              CaloricNeedCounter(widget.activityLevel),
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: heightScreen * 0.18,
        width: widthScreen * 0.18,
        child: FloatingActionButton(
          heroTag: 'Edit1',
          child: Icon(Icons.edit, size: heightScreen * 0.060),
          onPressed: () => Navigator.pushNamed(context, Screens.editAnimal),
        ),
      ),
    );
  }
}
