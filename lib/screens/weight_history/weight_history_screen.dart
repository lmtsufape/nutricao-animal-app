import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class WeightHistoryScreen extends StatefulWidget {
  const WeightHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WeightHistoryScreen> createState() => _WeightHistoryScreenState();
}

class _WeightHistoryScreenState extends State<WeightHistoryScreen> {
  Widget chart = Container();
  bool chartLoaded = false;

  getChart() {
    if (!chartLoaded) {
      //chart = ChartHistory();
      chartLoaded = true;
    }
    return chart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarCustom(context),
      drawer: NavigationDrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text('Histórico de peso',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kHugeSize,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Name',
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: kMediumSize,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: TimeRadioButtons(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
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

class ChartHistory extends StatefulWidget {
  double weight;

  ChartHistory({Key? key, required this.weight}) : super(key: key);

  @override
  State<ChartHistory> createState() => _ChartHistoryState();
}

enum Period { week, month, year }

class _ChartHistoryState extends State<ChartHistory> {
  List<Color> gradientColors = [
    const Color(0xFFE8EFF3),
    const Color(0xFF1AA3F0),
  ];
  Period period = Period.week;
  List<Map<String, dynamic>> history = [];
  List dataComplete = [];
  List<FlSpot> dataChart = [];
  double maxX = 0;
  double maxY = 0;
  double minY = 0;
  ValueNotifier<bool> loaded = ValueNotifier(false);
  //late AnimalRepository repository;

  setData() async {
    loaded.value = false;
    dataChart = [];
   // if (history.isEmpty)
     // history = await repository.getHistoryWeight(widget.weight);
  }

  @override
  Widget build(BuildContext context) {
    //repository = context.read<AnimalRepository>();
    setData();

    return Container(
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(
          children: [
           /* ValueListenableBuilder(
              valueListenable: loaded,
              builder: (context, bool isLoaded, _) {
                return (isLoaded)
                    ? LineChart(
                        getChartData(),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
