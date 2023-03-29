import 'package:flutter/material.dart';
import 'package:thunderapp/components/utils/horizontal_spacer_box.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/components/dialogs/delete_animal_dialog.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';

import '../../../shared/constants/app_text_constants.dart';
import '../../../shared/constants/style_constants.dart';
import '../../../shared/core/models/animal_model.dart';
import '../../food/food_screen.dart';
import 'staggered_grid_animal.dart';

// ignore: must_be_immutable
class CardAnimal extends StatefulWidget {
  AnimalModel animal;

  CardAnimal(this.animal, {Key? key}) : super(key: key);

  @override
  stateCardAnimal createState() => stateCardAnimal();
}

// ignore: camel_case_types
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: widthCard * 0.40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.center,
                              heightFactor: 0.00070 * heightCard,
                              child: Image(
                                image: NetworkImage(
                                    '$kBaseUrl/image/${widget.animal.id}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: widthCard * 0.42,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Nome',
                                  style: TextStyle(
                                    color: kDetailColor,
                                    fontSize: heightCard * 0.020,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 88),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              DeleteAnimalDialog(
                                                  widget.animal.id));
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: kBackgroundColor,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.animal.name.toString(),
                            style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: heightCard * 0.022,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            height: heightCard * 0.03,
                          ),
                          Text(
                            'Raça',
                            style: TextStyle(
                                color: kDetailColor,
                                fontSize: heightCard * 0.020),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            //Trocar para o nome da raça widget.animal.breed.toString(), quando arrumar a API
                            widget.animal.breed.toString(),
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: heightCard * 0.022,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: heightCard * 0.045,
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SizedBox(
                      height: heightCard * 0.07,
                      width: widthCard * 0.25,
                      child: FloatingActionButton(
                        heroTag: 'Menu',
                        backgroundColor: kDetailColor,
                        onPressed: () =>
                            Navigator.pushNamed(context, Screens.privateMenu),
                        child: Icon(
                          Icons.menu_book_outlined,
                          color: kBackgroundColor,
                          size: widthCard * 0.08,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 37),
                    child: SizedBox(
                      height: heightCard * 0.07,
                      width: widthCard * 0.25,
                      child: FloatingActionButton(
                        heroTag: 'Eat',
                        backgroundColor: kDetailColor,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodScreen(widget.animal.id))),
                        child: Icon(
                          Icons.restaurant_outlined,
                          color: kBackgroundColor,
                          size: widthCard * 0.08,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 20),
                    child: SizedBox(
                      height: heightCard * 0.07,
                      width: widthCard * 0.16,
                      child: FloatingActionButton(
                        heroTag: 'Share',
                        backgroundColor: kDetailColor,
                        onPressed: () {},
                        child: Icon(
                          Icons.share,
                          color: kBackgroundColor,
                          size: widthCard * 0.08,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: StaggeredGridAnimal(widget.animal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
