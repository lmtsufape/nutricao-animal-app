import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class WeightHistoryScreen extends StatelessWidget {
  const WeightHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarCustom(context),
      drawer: NavigationDrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text('Histórico de peso',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kLargeSize,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Name',
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: kMediumSize,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: TimeRadioButtons(),
          ),
        ],
      ),
    );
  }
}

class TimeRadioButtons extends StatelessWidget {
  const TimeRadioButtons({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return CustomRadioButton(
      wrapAlignment: WrapAlignment.start,
      enableShape: true,
      width: 110,
      elevation: 0,
      unSelectedColor: kBackgroundColor,
      unSelectedBorderColor: kSecondaryColor,
      buttonLables: const [
        'Semana',
        'Mês',
        'Ano',
      ],
      buttonValues: const [
        "SEMANA",
        "MÊS",
        "ANO",
      ],
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: kBackgroundColor,
          unSelectedColor: kSecondaryColor,
          textStyle: TextStyle(
              fontSize: kMediumSize,
              color: kSecondaryColor,
              fontWeight: FontWeight.w700)),
        radioButtonValue: (value) {
              print(value);
      },
      selectedColor: kSecondaryColor,
    );
  }
}

