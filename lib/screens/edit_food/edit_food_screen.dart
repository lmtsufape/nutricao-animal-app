import 'package:flutter/material.dart';

import 'package:thunderapp/screens/screens_index.dart';

import 'package:thunderapp/shared/constants/app_number_constants.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../components/forms/dropdown_custom.dart';
import '../../components/forms/text_field_custom.dart';

class EditFoodScreen extends StatelessWidget {
  const EditFoodScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSave =
      ElevatedButton.styleFrom(backgroundColor: kSecondaryColor);

  @override
  Widget build(BuildContext context) {
    TextEditingController nickController = TextEditingController();
    TextEditingController quantController = TextEditingController();

    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              'Editar Comida',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: heightScreen * kHugeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              'Name > Cardápio Particular > Food',
              style: TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
            ),
          ),
          TextFieldCustom('Apelido', nickController, ''),
          const DropDownCustom(['Carne', 'Peixe', 'Ração'], 'Tipo', 3),
          const DropDownCustom(
              ['Arroz e feijão', 'Carne com ração', 'Sachê de Salmão'],
              'Comida',
              4),
          TextFieldCustom('Quantidade(em gramas)', quantController, ''),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: SizedBox(
                width: widthScreen * 0.3,
                height: heightScreen * 0.040,
                child: ElevatedButton(
                  style: styleSave,
                  onPressed: () {},
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: heightScreen * kMediumLargeSize,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
