import 'package:flutter/material.dart';
import 'package:thunderapp/components/utils/horizontal_spacer_box.dart';
import 'package:thunderapp/shared/components/dialogs/add_user_dialog.dart';
import 'package:thunderapp/shared/components/dialogs/delete_animal_dialog.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';

import '../../../shared/constants/style_constants.dart';
import '../../food/food_screen.dart';
import 'staggered_grid_animal.dart';

class CardAnimal extends StatefulWidget {
  int id;
  String name;
  String sex;
  int activityLevel;
  CardAnimal(this.id, this.name, this.sex, this.activityLevel, {Key? key})
      : super(key: key);

  @override
  stateCardAnimal createState() => stateCardAnimal();
}

class stateCardAnimal extends State<CardAnimal> {
  @override
  Widget build(BuildContext context) {
    final heightCard = MediaQuery.of(context).size.height;
    final widthCard = MediaQuery.of(context).size.width;
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
                leading: Icon(
                  Icons.add_a_photo,
                  size: heightCard * 0.15,
                  color: kBackgroundColor,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 65),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HorizontalSpacerBox(size: SpacerSize.huge),
                          Text(
                            'Nome',
                            style: TextStyle(
                              color: kDetailColor,
                              fontSize: heightCard * 0.020,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      DeleteAnimalDialog(widget.id));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: kBackgroundColor,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.name.toString(),
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: heightCard * 0.022,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Raça',
                          style: TextStyle(
                              color: kDetailColor,
                              fontSize: heightCard * 0.020),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        'Pastor Alemão',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: heightCard * 0.022,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: heightCard * 0.10,
                        width: widthCard * 0.17,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () {},
                          child: Icon(
                            Icons.menu_book_outlined,
                            color: kBackgroundColor,
                            size: heightCard * 0.045,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: SizedBox(
                        height: heightCard * 0.10,
                        width: widthCard * 0.17,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodScreen(widget.id))),
                          child: Icon(
                            Icons.restaurant_outlined,
                            color: kBackgroundColor,
                            size: heightCard * 0.045,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 20),
                      child: SizedBox(
                        height: heightCard * 0.10,
                        width: widthCard * 0.17,
                        child: FloatingActionButton(
                          backgroundColor: kDetailColor,
                          onPressed: () {},
                          child: Icon(
                            Icons.share,
                            color: kBackgroundColor,
                            size: heightCard * 0.045,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: StaggeredGridAnimal(widget.sex, widget.activityLevel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}