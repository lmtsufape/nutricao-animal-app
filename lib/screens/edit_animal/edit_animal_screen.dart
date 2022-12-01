import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class EditAnimalScreen extends StatelessWidget {
  const EditAnimalScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSalvar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();
    TextEditingController idadeController = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25.0, left: 16.0),
                child: Text(
                  'Editar informações',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: kLargeSize,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Name',
                  style:
                      TextStyle(color: kSecondaryColor, fontSize: kMediumSize),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: FloatingActionButton(
                      backgroundColor: kBackgroundColor,
                      onPressed: () {},
                      child: const Icon(
                        Icons.photo,
                        color: kSecondaryColor,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              TextFieldCustom('Nome', nameController),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Espécie',
                  style: TextStyle(color: kSecondaryColor),
                ),
              ),
              const SpecieWidget(),
              DropDownCustom(['Labrador', 'Pitbull', 'Rotweiller', 'Pastor Alemão'],'Raça'),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Sexo',
                  style: TextStyle(color: kSecondaryColor),
                ),
              ),
              const AnimalSexWidget(),
              TextFieldCustom('Peso', pesoController),
              TextFieldCustom('Altura', alturaController),
              TextFieldCustom('Idade', idadeController),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Seu animal é castrado(a)?',
                  style: TextStyle(color: kSecondaryColor),
                ),
              ),
              const CastratedWidget(),
              DropDownCustom(['SIM', 'NÃO'],'Nível de atividade'),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    child: ElevatedButton(
                      style: styleSalvar,
                      child: const Text('Salvar',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
