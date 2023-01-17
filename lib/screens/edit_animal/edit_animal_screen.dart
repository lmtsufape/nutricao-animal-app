import 'package:flutter/material.dart';
import 'package:nutricaoanimal/screens/add_animal/add_animal_screen.dart';
import 'package:nutricaoanimal/shared/constants/app_number_constants.dart';
import 'package:nutricaoanimal/shared/constants/style_constants.dart';

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
              Column(
                children: [
                  RadioListTile(
                    title: Text('Cachorro'),
                    value: 'dog',
                    groupValue: specie,
                    onChanged: (value) {
                      setState(
                        () {
                          specie = value.toString();
                        },
                      );
                    },
                  ),
                  RadioListTile(
                    title: Text('Gato'),
                    value: 'cat',
                    groupValue: specie,
                    onChanged: (value) {
                      setState(
                        () {
                          specie = value.toString();
                        },
                      );
                    },
                  ),
                ],
              ),
              DropDownCustom(const [
                'Border Collie',
                'pastor alemão',
              ], 'Raça', 1),
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
              DropDownCustom(const ['1', '2', '3'], 'Nível de atividade', 2),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    child: ElevatedButton(
                      style: EditAnimalScreen.styleSalvar,
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
