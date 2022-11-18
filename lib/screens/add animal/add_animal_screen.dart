import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add%20animal/add_animal_controller.dart';
import 'package:thunderapp/screens/add%20animal/add_animal_repository.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';

import '../../shared/core/models/user_model.dart';

class AddAnimalScreen extends StatefulWidget {
  UserModel userModel = UserModel();
  AddAnimalScreen(this.userModel, {Key? key}) : super(key: key);

  static ButtonStyle styleAdicionar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  selectImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) setState(() => photo = file);
    } catch (e) {
      print(e);
    }
  }

  XFile? photo;
  @override
  Widget build(BuildContext context) {
    AddAnimalController controller = AddAnimalController();
    TextEditingController nameController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    final AppTheme formCustom = AppTheme();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:
          formCustom.appBarCustom(context, widget.userModel.name.toString()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 15.0),
              child: Text(
                'Adicionar Pet',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: kLargeSize,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: FloatingActionButton(
                    backgroundColor: kBackgroundColor,
                    onPressed: () => selectImage,
                    child: photo != null
                        ? Image.file(File(photo!.path))
                        : Icon(
                            Icons.photo,
                            color: kSecondaryColor,
                            size: 50,
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
                style: TextStyle(color: kSecondaryColor),
              ),
            ),
            SpecieWidget(),
            /*Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Raça',
                style: TextStyle(color: kSecondaryColor),
              ),
            ),*/
            TextFieldButton('Raça'),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Sexo',
                style: TextStyle(color: kSecondaryColor),
              ),
            ),
            AnimalSexWidget(),
            TextFieldCustom('Peso', weightController),
            TextFieldCustom('Altura', heightController),
            TextFieldCustom('Idade', ageController),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Seu animal é castrado(a)?',
                style: TextStyle(color: kSecondaryColor),
              ),
            ),
            CastratedWidget(),
            TextFieldButton('Nível de atividade'),
            Center(
              child: SizedBox(
                height: 50,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 5),
                  child: ElevatedButton(
                    style: AddAnimalScreen.styleAdicionar,
                    child: Text('Adicionar',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20)),
                    onPressed: () {
                      controller.adicionarAnimal(
                        widget.userModel,
                        context,
                        nameController.text,
                        weightController.text,
                        ageController.text,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  final String _fieldLabel;
  final TextEditingController controller;

  TextFieldCustom(this._fieldLabel, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fieldLabel,
              style: TextStyle(color: kSecondaryColor),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldButton extends StatelessWidget {
  final String _buttonFieldLabel;

  TextFieldButton(this._buttonFieldLabel);

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
                  _buttonFieldLabel,
                  style: TextStyle(color: kSecondaryColor),
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

enum Specie { dog, cat }

class SpecieWidget extends StatefulWidget {
  const SpecieWidget({super.key});

  @override
  State<SpecieWidget> createState() => _SpecieWidgetState();
}

class _SpecieWidgetState extends State<SpecieWidget> {
  Specie? _animalSpecie = Specie.dog;

  @override
  Widget build(BuildContext context) {
    AddAnimalRepository _repository = AddAnimalRepository();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: const Text(
              'Cachorro',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<Specie>(
                activeColor: kDetailColor,
                value: Specie.dog,
                groupValue: _animalSpecie,
                onChanged: (Specie? value) {
                  setState(() {
                    _repository.getBreed();
                    _animalSpecie = value;
                  });
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: const Text(
              'Gato',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<Specie>(
                value: Specie.cat,
                activeColor: kDetailColor,
                groupValue: _animalSpecie,
                onChanged: (Specie? value) {
                  setState(() {
                    _repository.getBreed();
                    _animalSpecie = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum AnimalSex { male, female }

class AnimalSexWidget extends StatefulWidget {
  const AnimalSexWidget({super.key});

  @override
  State<AnimalSexWidget> createState() => _AnimalSexWidgetState();
}

class _AnimalSexWidgetState extends State<AnimalSexWidget> {
  AnimalSex? _animalSex = AnimalSex.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: const Text(
              'Masculino',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<AnimalSex>(
                activeColor: kDetailColor,
                value: AnimalSex.male,
                groupValue: _animalSex,
                onChanged: (AnimalSex? value) {
                  setState(() {
                    _animalSex = value;
                  });
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: const Text(
              'Feminino',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<AnimalSex>(
                value: AnimalSex.female,
                activeColor: kDetailColor,
                groupValue: _animalSex,
                onChanged: (AnimalSex? value) {
                  setState(() {
                    _animalSex = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum Castrated { yes, no }

class CastratedWidget extends StatefulWidget {
  const CastratedWidget({super.key});

  @override
  State<CastratedWidget> createState() => _CastratedWidgetState();
}

class _CastratedWidgetState extends State<CastratedWidget> {
  Castrated? _castratedAnimal = Castrated.yes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: const Text(
              'Sim',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<Castrated>(
                activeColor: kDetailColor,
                value: Castrated.yes,
                groupValue: _castratedAnimal,
                onChanged: (Castrated? value) {
                  setState(() {
                    _castratedAnimal = value;
                  });
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: const Text(
              'Não',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 2,
              child: Radio<Castrated>(
                value: Castrated.no,
                activeColor: kDetailColor,
                groupValue: _castratedAnimal,
                onChanged: (Castrated? value) {
                  setState(() {
                    _castratedAnimal = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
