import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class AddAnimalScreen extends StatelessWidget {
  const AddAnimalScreen({Key? key}) : super(key: key);

  static ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: kBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarCustom(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15.0),
            child: Text('Adicionar Pet', textDirection: TextDirection.ltr, style: TextStyle(fontSize: kLargeSize, color: kPrimaryColor, fontWeight: FontWeight.w900,),),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: FloatingActionButton(
                  backgroundColor: kBackgroundColor,
                  onPressed: () {},
                  child: Icon(Icons.photo, color: kSecondaryColor, size: 50,),
                ),
              ),
            ),
          )
        ],
      ),
      );
  }
}
