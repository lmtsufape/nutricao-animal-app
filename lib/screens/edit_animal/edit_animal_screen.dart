import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../components/forms/dropdown_custom.dart';
import '../../components/forms/text_field_custom.dart';
import '../add_animal/animal_sex.dart';
import '../add_animal/castrated_widget.dart';

class EditAnimalScreen extends StatefulWidget {
  const EditAnimalScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSalvar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  State<EditAnimalScreen> createState() => _EditAnimalScreenState();
}

class _EditAnimalScreenState extends State<EditAnimalScreen> {
  String? specie;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    TextEditingController nameController = TextEditingController();
    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();
    TextEditingController idadeController = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 16.0),
                child: Text(
                  'Editar informações',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: heightScreen * kLargeSize,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Name',
                  style:
                      TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                    width: widthScreen * 0.4,
                    height: heightScreen * 0.12,
                    child: FloatingActionButton(
                      heroTag: 'Photo',
                      backgroundColor: kBackgroundColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.photo,
                        color: kSecondaryColor,
                        size: widthScreen * 0.10,
                      ),
                    ),
                  ),
                ),
              ),
              TextFieldCustom('Nome', nameController),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Espécie',
                  style: TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('Cachorro', style: TextStyle(fontSize: heightScreen * kMediumLargeSize)),
                      value: 'dog',
                      groupValue: specie,
                      activeColor: kDetailColor,
                      onChanged: (value) {
                        setState(
                          () {
                            specie = value.toString();
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('Gato', style: TextStyle(fontSize: heightScreen * kMediumLargeSize),),
                      value: 'cat',
                      groupValue: specie,
                      activeColor: kDetailColor,
                      onChanged: (value) {
                        setState(
                          () {
                            specie = value.toString();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const DropDownCustom([
                'Border Collie',
                'pastor alemão',
              ], 'Raça', 1),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Sexo',
                  style: TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                ),
              ),
              const AnimalSexWidget(),
              TextFieldCustom('Peso', pesoController),
              TextFieldCustom('Altura', alturaController),
              TextFieldCustom('Idade', idadeController),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Seu animal é castrado(a)?',
                  style: TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                ),
              ),
              const CastratedWidget(),
              const DropDownCustom(['1', '2', '3'], 'Nível de atividade', 2),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 10),
                  child: SizedBox(
                    width: widthScreen * 0.3,
                    height: heightScreen * 0.040,
                    child: ElevatedButton(
                      style: EditAnimalScreen.styleSalvar,
                      child: Text('Salvar',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w500,
                              fontSize: heightScreen * kMediumLargeSize)),
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
  }
}
