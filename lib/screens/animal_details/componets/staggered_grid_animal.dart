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

  @override
  Widget build(BuildContext context) {
    final heightStaggered = MediaQuery.of(context).size.height;
    final widthStaggered = MediaQuery.of(context).size.width;
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
              mainAxisCellCount: 0.65,
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
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.023),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.animal.specie,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.023),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.65,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: BorderSide.strokeAlignOutside),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Idade: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.023),
                    children: <TextSpan>[
                      TextSpan(
                        text: '3 anos',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.023),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.5,
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
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.023),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.animal.sex,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.023),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.65,
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
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                          fontSize: heightStaggered * 0.023),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${widget.animal.weight} Kg",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                              fontSize: heightStaggered * 0.020),
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 0, top: 5, left: 2),
                    child: SizedBox(
                      height: heightStaggered * 0.045,
                      width: widthStaggered * 0.08,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: FloatingActionButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Screens.weightHistory),
                          backgroundColor: kDetailColor,
                          child: Icon(
                            Icons.area_chart_outlined,
                            color: kBackgroundColor,
                            size: heightStaggered * 0.025,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 0.65,
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
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.023),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${widget.animal.height} cm",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.023),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.5,
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
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.023),
                    children: <TextSpan>[
                      TextSpan(
                        text: getCastrado(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.023),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 0.5,
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
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                        fontSize: heightStaggered * 0.023),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Ativo',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: heightStaggered * 0.023),
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
