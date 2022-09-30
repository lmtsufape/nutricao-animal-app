import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class NoRegFoodScreen extends StatelessWidget {
  const NoRegFoodScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSa = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: NavigationDrawerWidget(),
      appBar: AppBarCustom(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 16, bottom: 16),
            child: Text('Sugestão de comida não cadastrada', style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.w900),),
          ),
          TextFieldCustom('Nome'),
          TextFieldButton('Categoria'),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextFieldCustom('Umidade'),
          ),
          TextFieldCustom("Valor energético"),
          TextFieldCustom('Valor proteico'),
          TextFieldCustom('Lipídios'),
          TextFieldCustom('Carboidratos'),
          TextFieldCustom('Cálcio'),
          TextFieldCustom('Fibra'),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                    style: styleSa,
                    onPressed: () {},
                    child: const Text('Adicionar', style: TextStyle(color: kBackgroundColor, fontWeight: FontWeight.w900, fontSize: kMediumLargeSize),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
