import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class EditFoodScreen extends StatelessWidget {
  const EditFoodScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSave =
      ElevatedButton.styleFrom(backgroundColor: kSecondaryColor);

  @override
  Widget build(BuildContext context) {
    TextEditingController nickController = TextEditingController();
    TextEditingController quantController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              'Editar Comida',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kHugeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              'Name > Cardápio Particular > Food',
              style: TextStyle(color: kSecondaryColor, fontSize: kMediumSize),
            ),
          ),
          TextFieldCustom('Apelido', nickController),
          DropDownCustom( ['Carne', 'Peixe', 'Ração'] ,'Tipo'),
          DropDownCustom(['Arroz e feijão', 'Carne com ração', 'Sachê de Salmão'],'Comida'),
          TextFieldCustom('Quantidade(em gramas)', quantController),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 110,
                child: ElevatedButton(
                  style: styleSave,
                  onPressed: () {},
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: kMediumLargeSize,
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
