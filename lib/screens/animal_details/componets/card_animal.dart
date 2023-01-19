import 'package:flutter/material.dart';

import '../../../shared/constants/style_constants.dart';
import 'staggered_grid_animal.dart';

class CardAnimal extends StatefulWidget {
  String name;
  String sex;
  int activityLevel;
  CardAnimal(this.name, this.sex, this.activityLevel, {Key? key})
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
        padding: EdgeInsets.all(12),
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
                      Text(
                        'Nome',
                        style: TextStyle(
                          color: kDetailColor,
                          fontSize: heightCard * 0.020,
                        ),
                        textAlign: TextAlign.left,
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
                          onPressed: () {},
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
                padding: EdgeInsets.only(top: 4),
                child: StaggeredGridAnimal(widget.sex, widget.activityLevel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
