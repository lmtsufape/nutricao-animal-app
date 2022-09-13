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
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)));

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
                width: 120,
                height: 120,
                child: FloatingActionButton(
                  backgroundColor: kBackgroundColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.photo,
                    color: kSecondaryColor,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          TextFieldCustom('Nome'),
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
          TextFieldCustom('Raça'),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Sexo',
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
          AnimalSexWidget(),
          TextFieldCustom('Peso'),
          TextFieldCustom('Altura'),
          TextFieldCustom('Idade'),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Seu animal é castrado(a)?',
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
          CastratedWidget(),
        ],
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  final String _fieldLabel;

  TextFieldCustom(this._fieldLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fieldLabel,
              style: TextStyle(color: kSecondaryColor),
            ),
            TextField(
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
