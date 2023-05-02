// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

import '../../../shared/constants/style_constants.dart';
import '../../../shared/core/models/animal_model.dart';
import '../animal_details_controller.dart';

class CaloricNeedCounter extends StatefulWidget {
  AnimalModel animal;
  int activityLevel;
  CaloricNeedCounter(this.activityLevel, this.animal, {Key? key})
      : super(key: key);

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
              RadialGaugeAnimal(widget.animal),
            ],
          ),
        ),
      ),
    );
  }
}

class RadialGaugeAnimal extends StatefulWidget {
  AnimalModel animal;

  RadialGaugeAnimal(this.animal, {Key? key}) : super(key: key);

  @override
  stateRadialGaugeAnimal createState() => stateRadialGaugeAnimal();
}

class stateRadialGaugeAnimal extends State<RadialGaugeAnimal> {
  final AnimalDetailsController animalController = AnimalDetailsController();
  late double caloric = 0;

  @override
  void initState() {
    updateCaloric();
    super.initState();
  }

  Future<double> getCaloric() async {
    final value = await animalController.caloric(widget.animal);
    return value;
  }

  updateCaloric() {
    getCaloric().then((value) {
      setState(() {
        caloric = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightGauge = MediaQuery.of(context).size.height;
    double weight = double.parse(widget.animal.weight);
    double amountFed = 1.6 * 138 * pow(weight, 0.75);

    String specie = 'cat';
    String breed = 'Gladyce Oberbrunner';
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 3000,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 2 * amountFed,
          radiusFactor: 0.65,
          startAngle: 180,
          endAngle: 0,
          centerX: 0.5,
          centerY: 0.4,
          showLabels: false,
          showTicks: false,
          ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 1 / 6 * (2 * amountFed),
                color: Colors.red),
            GaugeRange(
                startValue: 1 / 6 * (2 * amountFed),
                endValue: 2 / 6 * (2 * amountFed),
                color: Colors.yellow),
            GaugeRange(
                startValue: 2 / 6 * (2 * amountFed),
                endValue: 4 / 6 * (2 * amountFed),
                color: Colors.green),
            GaugeRange(
                startValue: 4 / 6 * (2 * amountFed),
                endValue: 5 / 6 * (2 * amountFed),
                color: Colors.yellow),
            GaugeRange(
                startValue: 5 / 6 * (2 * amountFed),
                endValue: 2 * amountFed,
                color: Colors.red),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: caloric,
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
                '',
                style: TextStyle(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: heightGauge * kMediumLargeSize),
              ),
            )
          ],
        ),
      ],
    );
  }
}
