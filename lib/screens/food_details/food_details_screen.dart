import 'package:flutter/material.dart';

import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  static ButtonStyle styleDelete = ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
  );

  static ButtonStyle styleNao = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  );

  static ButtonStyle styleSim = ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  );

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: CardDetails(),
          ),
          const Center(
            child: FoodTable(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: SizedBox(
                width: widthScreen * 0.6,
                height: heightScreen * 0.040,
                child: ElevatedButton.icon(
                  style: styleDelete,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(bottom: 435),
                        child: AlertDialog(
                          insetPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: kBackgroundColor,
                          content: Text(
                            'Tem certeza que deseja remover Food do cardápio de Name?',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: heightScreen * kLargeSize,
                                fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 28, bottom: 12),
                                  child: SizedBox(
                                    width: widthScreen * 0.3,
                                    height: heightScreen * 0.040,
                                    child: ElevatedButton(
                                      style: styleNao,
                                      onPressed: () => Navigator.pushNamed(
                                          context, Screens.foodDetails),
                                      child: Text(
                                        'Não',
                                        style: TextStyle(
                                            color: kBackgroundColor,
                                            fontSize: heightScreen * kMediumLargeSize,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: SizedBox(
                                    width: widthScreen * 0.3,
                                    height: heightScreen * 0.040,
                                    child: ElevatedButton(
                                      style: styleSim,
                                      onPressed: () => Navigator.pushNamed(
                                          context, Screens.privateMenu),
                                      child: Text(
                                        'Sim',
                                        style: TextStyle(
                                            color: kBackgroundColor,
                                            fontSize: heightScreen * kMediumLargeSize,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: kBackgroundColor,
                    size: widthScreen * 0.06,
                  ),
                  label: Text(
                    'Remover do cardápio',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: heightScreen * kMediumLargeSize,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: widthScreen * 0.25,
        height: heightScreen * 0.1,
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Screens.editFood),
          backgroundColor: kSecondaryColor,
          child: Icon(
            Icons.edit,
            size: widthScreen * 0.1,
            color: kBackgroundColor,
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Center(
        child: SizedBox(
          height: heightScreen * 0.11,
          width: widthScreen * 0.94,
          child: Card(
            shadowColor: kPrimaryColor,
            color: kBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 4, top: 10),
                    child: Text(
                      'Food',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: heightScreen * kHugeSize,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      'Name > Cardápio Particular > Food',
                      style: TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodTable extends StatelessWidget {
  const FoodTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const FixedColumnWidth(450),
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(15.0),
        color: kPrimaryColor,
        style: BorderStyle.solid,
        width: 4,
      ),
      children: [
        _createLineTable('Tipo', 'Ração'),
        _createLineTable('Quantidade', '55g'),
        _createLineTable('Type', 'String'),
        _createLineTable('Type', 'String'),
        _createLineTable('Type', 'String'),
        _createLineTable('Type', 'String'),
      ],
    );
  }
}

_createLineTable(String foodLabel, String foodValue) {
  return TableRow(
    children: foodLabel.split(',').map((label) {
      return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
              child: Text(
                '$label: ',
                style: const TextStyle(
                    fontSize: 18,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                foodValue,
                style: const TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
