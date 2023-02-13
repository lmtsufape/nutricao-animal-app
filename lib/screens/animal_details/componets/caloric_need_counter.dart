// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../shared/constants/style_constants.dart';
import '../animal_details_controller.dart';

class CaloricNeedCounter extends StatefulWidget {

  CaloricNeedCounter( {Key? key}) : super(key: key);

  @override
  stateCaloricNeedCounter createState() => stateCaloricNeedCounter();
}

class stateCaloricNeedCounter extends State<CaloricNeedCounter> {
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
              RadialGaugeAnimal(5),
            ],
          ),
        ),
      ),
    );
  }
}

class RadialGaugeAnimal extends StatefulWidget {
  int activityLevel;
  RadialGaugeAnimal(this.activityLevel, {Key? key}) : super(key: key);
  @override
  stateRadialGaugeAnimal createState() => stateRadialGaugeAnimal();
}

class stateRadialGaugeAnimal extends State<RadialGaugeAnimal> {
  @override
  Widget build(BuildContext context) {
    final heightGauge = MediaQuery.of(context).size.height;
    final AnimalDetailsController animalController = AnimalDetailsController();
    //int food = 6;
    String specie = 'cat';
    String breed = 'Gladyce Oberbrunner';
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
              value:
                  animalController.caloric(widget.activityLevel, specie, breed),
              enableAnimation: true,
              needleColor: kSecondaryColor,
              knobStyle: const KnobStyle(
                color: kBackgroundColor,
                borderColor: kSecondaryColor,
                borderWidth: 0.05,
              ),
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: -10,
              positionFactor: 3.5,
              widget: Text(
                'Necessidade calórica diária já atingida',
                style: TextStyle(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: heightGauge * 0.018),
              ),
            )
          ],
        ),
      ],
    );
  }
}
