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
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Column(
            children: const [
              CardAnimal(),
              CaloricNeedCounter(),
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: heightScreen * 0.18,
        width: widthScreen * 0.18,
        child: FloatingActionButton(
          child: Icon(Icons.edit, size: heightScreen * 0.060),
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
                      Text(
                        'Nome',
                        style: TextStyle(
                          color: kDetailColor,
                          fontSize: heightCard * 0.020,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Johnny Cash',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: heightCard * 0.022,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
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
                padding: const EdgeInsets.only(top: 4),
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
                        text: 'Masculino',
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

class CaloricNeedCounter extends StatelessWidget {
  const CaloricNeedCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightCaloric = MediaQuery.of(context).size.height;
    return SizedBox(
      height: heightCaloric * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: Text(
                  'Medidor de necessidade calórica:',
                  style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: heightCaloric * 0.022,
                      fontWeight: FontWeight.bold),
                  textDirection: TextDirection.ltr,
                ),
              ),
              RadialGaugeAnimal(),
            ],
          ),
        ),
      ),
    );
  }
}

class RadialGaugeAnimal extends StatelessWidget {
  const RadialGaugeAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightGauge = MediaQuery.of(context).size.height;
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 3000,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          radiusFactor: 0.65,
          startAngle: 180,
          endAngle: 0,
          centerX: 0.5,
          centerY: 0.4,
          showLabels: false,
          showTicks: false,
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 25, color: Colors.red),
            GaugeRange(startValue: 25, endValue: 45, color: Colors.yellow),
            GaugeRange(startValue: 45, endValue: 55, color: Colors.green),
            GaugeRange(startValue: 55, endValue: 75, color: Colors.yellow),
            GaugeRange(startValue: 75, endValue: 100, color: Colors.red),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: 50,
              enableAnimation: true,
              needleColor: kSecondaryColor,
              knobStyle: KnobStyle(
                color: kBackgroundColor,
                borderColor: kSecondaryColor,
                borderWidth: 0.05,
              ),
            ),
          ],
         /* annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: -10,
              positionFactor: 3.5,
              widget: Text(
              'Necessidade calórica diária já atingida',
              style: TextStyle(
                  color: kBackgroundColor,
                  fontWeight: FontWeight.w500,
                  fontSize: heightGauge * 0.018),
            ),)
          ],*/
        ),
      ],
    );
  }
}
