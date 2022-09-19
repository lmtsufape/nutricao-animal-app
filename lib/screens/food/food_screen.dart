import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add%20animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  static ButtonStyle styleAlimentar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 16),
            child: Text(
              'Alimentar',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kHugeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 19,
              bottom: 16,
            ),
            child: Text('ANIMAL NAME',
                style:
                    TextStyle(color: kSecondaryColor, fontSize: kMediumSize)),
          ),
          TextFieldButtonPC('Escolher do cardápio'),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Center(
                child: Text(
              '-------------------- OU --------------------',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kMediumLargeSize,
                  fontWeight: FontWeight.w900),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, bottom: 8),
            child: Text(
              'Comida fora do cardápio',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kMediumLargeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          TextFieldButton('Tipo'),
          TextFieldCustom('Comida'),
          TextFieldCustom('Quantidade(em gramas)'),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                style: styleAlimentar,
                onPressed: () {},
                child: Text('Alimentar', style: TextStyle(color: kBackgroundColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldButtonPC extends StatelessWidget {
  final String _buttonPCFieldLabel;

  TextFieldButtonPC(this._buttonPCFieldLabel);

  static ButtonStyle styleButton = ElevatedButton.styleFrom(
    backgroundColor: kDetailColor,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _buttonPCFieldLabel,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kMediumLargeSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Selecione',
                    hintStyle: TextStyle(fontSize: 18),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_circle_down_sharp,
                          size: 35,
                          color: kDetailColor,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(14),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


