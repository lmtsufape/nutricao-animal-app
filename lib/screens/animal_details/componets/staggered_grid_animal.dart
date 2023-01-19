import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../shared/constants/style_constants.dart';
import '../../screens_index.dart';

class StaggeredGridAnimal extends StatefulWidget {
  String sex;
  int activityLevel;
  StaggeredGridAnimal(this.sex, this.activityLevel, {Key? key})
      : super(key: key);

  @override
  stateStaggeredGridAnimal createState() => stateStaggeredGridAnimal();
}

class stateStaggeredGridAnimal extends State<StaggeredGridAnimal> {
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
              mainAxisCellCount: 0.5,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
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
                        text: 'Gato',
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
              mainAxisCellCount: 0.5,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
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
                      strokeAlign: StrokeAlign.outside),
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
                        text: widget.sex,
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
              mainAxisCellCount: 0.5,
              child: ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: kPrimaryColor,
                        width: 3.5,
                        strokeAlign: StrokeAlign.outside),
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
                          text: '4,6Kg',
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
                      width: widthStaggered * 0.1,
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
              mainAxisCellCount: 0.5,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: kPrimaryColor,
                      width: 3.5,
                      strokeAlign: StrokeAlign.outside),
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
                        text: '38cm',
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
                      strokeAlign: StrokeAlign.outside),
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
                        text: 'Sim',
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
                      strokeAlign: StrokeAlign.outside),
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
