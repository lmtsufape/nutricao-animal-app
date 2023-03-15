import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/add_animal/add_animal_controller.dart';
import 'package:thunderapp/screens/add_animal/add_animal_repository.dart';
import 'package:thunderapp/screens/add_animal/image_profile.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign_in/sign_in_controller.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import '../../components/forms/text_field_custom.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_number_constants.dart';
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
  late Future<List<String>> breeds;

  int activityLevel = 1;
  String specie = 'dog';
  String breed = 'Sem Raça Definida';
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
    breeds = repository.getBreed(specie);
    signInController.getInstance(user);
  }

  @override
  void didChangeDependencies() {
    controller = context.watch<AddAnimalController>();
    super.didChangeDependencies();
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
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
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
                  fontSize: heightScreen * kLargeSize,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Center(
              child: ImageProfile(controller),
            ),
            TextFieldCustom('Nome', nameController, ''),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Espécie',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    activeColor: kDetailColor,
                    title: Text('Cachorro',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightScreen * kMediumLargeSize)),
                    value: 'dog',
                    groupValue: specie,
                    onChanged: (value) {
                      setState(
                        () {
                          specie = value.toString();
                          breed = 'Sem raça definida';
                          breeds = repository.getBreed(specie);
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    activeColor: kDetailColor,
                    title: Text('Gato',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightScreen * kMediumLargeSize)),
                    value: 'cat',
                    groupValue: specie,
                    onChanged: (value) {
                      setState(
                        () {
                          specie = value.toString();
                          breed = 'Sem raça definida';
                          breeds = repository.getBreed(specie);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Raça',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
              child: DropdownSearch<String>(
                selectedItem: breed,
                popupProps: const PopupProps.dialog(
                  showSearchBox: true,
                ),
                dropdownButtonProps: const DropdownButtonProps(
                  icon: Icon(
                    Icons.arrow_circle_down_outlined,
                    color: kDetailColor,
                    size: 35,
                  ),
                ),
                asyncItems: (String specie) => breeds,
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
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: RadioListTile(
                      activeColor: kDetailColor,
                      title: Text(
                        'Macho',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightScreen * kMediumLargeSize),
                      ),
                      value: 'macho',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(
                          () {
                            sex = value.toString();
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    activeColor: kDetailColor,
                    title: Text('Fêmea',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightScreen * kMediumLargeSize)),
                    value: 'fêmea',
                    groupValue: sex,
                    onChanged: (value) {
                      setState(
                        () {
                          sex = value.toString();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFieldCustom('Peso (Quilograma)', weightController, ''),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child:
                  TextFieldCustom('Medida (Centímetros)', heightController, ''),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFieldCustom('Idade', ageController, ''),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Seu animal é castrado(a)?',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    activeColor: kDetailColor,
                    title: Text('Sim',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightScreen * kMediumLargeSize)),
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
                ),
                Expanded(
                  child: RadioListTile(
                    activeColor: kDetailColor,
                    title: Text('Não',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightScreen * kMediumLargeSize)),
                    value: false,
                    groupValue: isCastrated,
                    onChanged: (value) {
                      setState(
                        () {
                          repository.getBreed(specie);
                          isCastrated = false;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Nível de Atividade',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
              child: DropdownSearch(
                dropdownButtonProps: const DropdownButtonProps(
                  icon: Icon(
                    Icons.arrow_circle_down_outlined,
                    color: kDetailColor,
                    size: 35,
                  ),
                ),
                items: const [1, 2, 3],
                onChanged: (data) {
                  setState(() {
                    activityLevel = data as int;
                  });
                },
              ),
            ),
            const VerticalSpacerBox(size: SpacerSize.medium),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 10),
                child: SizedBox(
                  width: widthScreen * 0.3,
                  height: heightScreen * 0.040,
                  child: ElevatedButton(
                    style: AddAnimalScreen.styleAdicionar,
                    child: Text('Adicionar',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.w500,
                            fontSize: heightScreen * kMediumLargeSize)),
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
            const VerticalSpacerBox(size: SpacerSize.medium),
          ],
        ),
      ),
    );
  }
}
