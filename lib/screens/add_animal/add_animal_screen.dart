import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:thunderapp/screens/add_animal/add_animal_controller.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign_in/sign_in_controller.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/animal_model.dart';
import 'package:thunderapp/shared/core/selected_item.dart';

import '../../shared/core/models/user_model.dart';

class AddAnimalScreen extends StatefulWidget {
  const AddAnimalScreen({Key? key}) : super(key: key);

  static ButtonStyle styleAdicionar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  final SignInController signInController = SignInController();
  final UserModel user = UserModel();
  final AddAnimalRepository repository = AddAnimalRepository();
  late String userName;
  final AnimalModel _animal = AnimalModel();
  late List<String> breeds = [];

  String activityLevel = '1';
  String specie = 'dog';
  String breed = 'pastor alemão';
  String sex = 'male';
  bool isCastrated = true;
  AddAnimalController controller = AddAnimalController();
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    signInController.getInstance(user);
  }

  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name')!;
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    final AppTheme formCustom = AppTheme();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: formCustom.appBarCustom(context, _getUserName()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 15.0),
              child: Text(
                'Adicionar Pet',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: heightScreen * 0.024,
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
              padding: EdgeInsets.only(left: 16, top: 4),
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
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: DropdownSearch(
                items: controller.showBreeds(specie),
                onChanged: (data) {
                  setState(
                    () {
                      breed = data.toString();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Sexo',
                style: TextStyle(
                    color: kSecondaryColor, fontSize: heightScreen * 0.016),
              ),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Macho'),
                  value: 'male',
                  groupValue: sex,
                  onChanged: (value) {
                    setState(
                      () {
                        sex = value.toString();
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: Text('Fêmea'),
                  value: 'female',
                  groupValue: sex,
                  onChanged: (value) {
                    setState(
                      () {
                        sex = value.toString();
                      },
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFieldCustom('Peso', weightController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFieldCustom('Altura', heightController),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFieldCustom('Idade', ageController),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Seu animal é castrado(a)?',
                style: TextStyle(
                    color: kSecondaryColor, fontSize: heightScreen * 0.016),
              ),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Sim'),
                  value: true,
                  groupValue: isCastrated,
                  onChanged: (value) {
                    setState(
                      () {
                        isCastrated = true;
                      },
                    );
                  },
                ),
                RadioListTile(
                  title: Text('Não'),
                  value: false,
                  groupValue: isCastrated,
                  onChanged: (value) {
                    setState(
                      () {
                        isCastrated = false;
                      },
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: DropdownSearch(
                items: const ['1', '2', '3'],
                onChanged: (data) {
                  setState(() {
                    activityLevel = data.toString();
                  });
                },
              ),
            ),
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
                            fontWeight: FontWeight.w500,
                            fontSize: heightScreen * 0.018)),
                    onPressed: () {
                      controller.adicionarAnimal(
                        context,
                        nameController.text,
                        specie,
                        breed,
                        sex,
                        weightController.text,
                        heightController.text,
                        ageController.text,
                        isCastrated,
                        activityLevel,
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
    final heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _fieldLabel,
            style: TextStyle(
                color: kSecondaryColor, fontSize: heightScreen * 0.016),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(14),
              border: OutlineInputBorder(),
            ),
          ),
        ],
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
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
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
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class DropDownCustom extends StatefulWidget {
  final String _labelDrop;
  final List<String> dropChoices;
  final int index;

  //construtor
  const DropDownCustom(this.dropChoices, this._labelDrop, this.index,
      {super.key});

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  final AddAnimalController _controller = AddAnimalController();
  String? _breed;
  final dropValue = ValueNotifier('');

  String? get breed => _breed;

  @override
  Widget build(BuildContext context) {
    print(dropValue.value.toString());
    final heightScreen = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 98,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget._labelDrop,
              style: TextStyle(
                  color: kSecondaryColor, fontSize: heightScreen * 0.016),
            ),
            ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: kDetailColor,
                        size: heightScreen * 0.040,
                      ),
                    ),
                    hint: Text(
                      'Selecione',
                      style: TextStyle(fontSize: heightScreen * 0.020),
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (String? choice) {
                      setState(() {
                        dropValue.value = choice.toString();
                        _breed = _controller.setBreed(widget.index, value);
                      });
                    },
                    items: widget.dropChoices
                        .map(
                          (choice) => DropdownMenuItem(
                            value: choice,
                            child: Text(choice),
                          ),
                        )
                        .toList(),
                  );
                }),
          ],
        ),
      ),
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
    final heightScreen = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: Text(
              'Masculino',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: heightScreen * 0.020),
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
            title: Text(
              'Feminino',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: heightScreen * 0.020),
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
    final heightScreen = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: Text(
              'Sim',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: heightScreen * 0.020),
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
            title: Text(
              'Não',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: heightScreen * 0.020),
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
