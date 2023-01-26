import 'package:flutter/material.dart';
import 'package:thunderapp/components/utils/vertical_spacer_box.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class NoRegFoodScreen extends StatelessWidget {
  const NoRegFoodScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSa = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController umidadeController = TextEditingController();
    TextEditingController energyController = TextEditingController();
    TextEditingController proteinaController = TextEditingController();
    TextEditingController lipidioController = TextEditingController();
    TextEditingController carboidratosController = TextEditingController();
    TextEditingController calcioController = TextEditingController();
    TextEditingController fibraController = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.user),
        ),
      ]),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 16, bottom: 16),
                child: Text(
                  'Sugestão de comida não cadastrada',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              TextFieldCustom('Nome', nameController),
              // ignore: prefer_const_constructors
              DropDownCustom(
                  const ['Grão', 'Líquido', 'Carne'], 'Categoria', 5),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFieldCustom('Umidade', umidadeController),
              ),
              TextFieldCustom("Valor energético", energyController),
              TextFieldCustom('Valor proteico', proteinaController),
              TextFieldCustom('Lipídios', lipidioController),
              TextFieldCustom('Carboidratos', carboidratosController),
              TextFieldCustom('Cálcio', calcioController),
              TextFieldCustom('Fibra', fibraController),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Center(
                  child: SizedBox(
                    width: 170,
                    height: 40,
                    child: ElevatedButton(
                      style: styleSa,
                      onPressed: () {},
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.w900,
                            fontSize: kMediumLargeSize),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpacerBox(size: SpacerSize.large)
            ],
          ),
        ],
      ),
    );
  }
}
