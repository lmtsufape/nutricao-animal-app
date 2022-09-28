import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';


class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  static ButtonStyle styleDelete = ElevatedButton.styleFrom(
      backgroundColor: Colors.redAccent,
      textStyle: const TextStyle(fontSize: kMediumSize),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)));

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
              padding: EdgeInsets.only(top: 16),
              child: CardDetails(),
            ),
            Center(
                child: FoodTable(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 240,
                  child: ElevatedButton.icon(
                    style: styleDelete,
                    onPressed: () {},
                    icon: const Icon(Icons.delete, color: kBackgroundColor, size: 30,),
                    label: const Text('Remover do cardápio', style: TextStyle(color: kBackgroundColor, fontSize: 17, fontWeight: FontWeight.w500),),
          ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Screens.editFood),
          backgroundColor: kSecondaryColor,
          child: const Icon(Icons.edit, size: 55, color: kBackgroundColor,),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 14, bottom: 14),
      child: SizedBox(
        height: 90,
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
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Food', style: TextStyle(color: kPrimaryColor, fontSize: kHugeSize, fontWeight: FontWeight.w900),),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Name > Cardápio Particular > Food', style: TextStyle(color: kSecondaryColor),),
                ),
              )
            ],
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

_createLineTable(String food_label, String food_value) {
  return TableRow(
    children: food_label.split(',').map((label) {
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
              child: Text(label + ': ', style: const TextStyle(fontSize: kMediumLargeSize, color: kSecondaryColor, fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                food_value,
                style: const TextStyle(fontSize: kMediumLargeSize, color: kPrimaryColor, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}



