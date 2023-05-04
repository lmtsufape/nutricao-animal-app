// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../shared/constants/style_constants.dart';
import '../../../shared/core/models/animal_model.dart';
import '../../screens_index.dart';

class StaggeredGridAnimal extends StatefulWidget {
  AnimalModel animal;
  StaggeredGridAnimal(this.animal, {Key? key}) : super(key: key);

  @override
  stateStaggeredGridAnimal createState() => stateStaggeredGridAnimal();
}

class stateStaggeredGridAnimal extends State<StaggeredGridAnimal> {
  String getCastrado() {
    if (widget.animal.isCastrated == true) {
      return 'Sim';
    } else {
      return 'Não';
    }
  }

  String newActivityLevel() {
    if (widget.animal.activityLevel == 1) {
      return 'Sedentário';
    } else if (widget.animal.activityLevel == 2) {
      return 'Normal';
    } else {
      return 'Ativo';
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightStaggered = MediaQuery.of(context).size.height;
    final widthStaggered = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
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
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.6,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Espécie: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.021),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.animal.specie,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.021),
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
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Sexo: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.021),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.animal.sex,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.021),
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
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Peso: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.021),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${widget.animal.weight} kg",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.021),
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
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Altura: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.021),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${widget.animal.height} m",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.021),
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
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Castrado: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.021),
                    children: <TextSpan>[
                      TextSpan(
                        text: getCastrado(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.021),
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
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Nível de atividade: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.020),
                    children: <TextSpan>[
                      TextSpan(
                        text: newActivityLevel(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.020),
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
