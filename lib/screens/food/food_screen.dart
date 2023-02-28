import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/components/utils/vertical_spacer_box.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/food/food_controller.dart';
import 'package:thunderapp/screens/food/food_repository.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/user_model.dart';

enum PrivateMenu { yes, no }

// ignore: must_be_immutable
class FoodScreen extends StatefulWidget {
  int? id;
  FoodScreen(this.id, {Key? key}) : super(key: key);

  static ButtonStyle styleAlimentar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // ignore: unused_field
  final FoodController _controller = FoodController();
  final UserModel user = UserModel();
  late String userName;
  final FoodRepository _repository = FoodRepository();
  String type = 'Ração';
  String food = 'Selecione';
  TextEditingController quantController = TextEditingController();
  List<String> listFoods = [];
  late Future<List<String>> listTypes;
  bool? addMenu;

  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name')!;
    return userName;
  }

  @override
  void initState() {
    listFoods = _repository.showFoods(type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    //final widthScreen = MediaQuery.of(context).size.width;
    final AppTheme formCustom = AppTheme();
    return Scaffold(
      appBar: formCustom.appBarCustom(context, _getUserName()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Alimentar',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kHugeSize,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: Text('Name',
                  style:
                      TextStyle(color: kSecondaryColor, fontSize: kMediumSize)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
              child: DropdownSearch<String>(
                selectedItem: 'Selecione',
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
                items: const [],
                onChanged: (data) {
                  setState(
                    () {
                      /* Aqui vai atualizar a variável do cardápio escolhido, pode ser
                      um booleano para fazer o preenchemento automático dos campos da tela
                      "Assunto a ser conversado" */
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 3,
                      width: 190,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Text(
                    'OU',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: kLargeSize),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 3,
                      width: 190,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                'Comida fora do cardápio',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kMediumLargeSize,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Tipo',
                style: TextStyle(
                    color: kSecondaryColor, fontSize: heightScreen * 0.016),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
              child: DropdownSearch<String>(
                selectedItem: type,
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
                asyncItems: (String categories) => _repository.showTypes(),
                onChanged: (data) {
                  setState(
                    () {
                      type = data.toString();
                      food = 'Selecione';
                      listFoods = _repository.showFoods(type);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Comida',
                style: TextStyle(
                    color: kSecondaryColor, fontSize: heightScreen * 0.016),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
              child: DropdownSearch<String>(
                selectedItem: food,
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
                items: listFoods,
                onChanged: (data) {
                  setState(
                    () {
                      food = data.toString();
                    },
                  );
                },
              ),
            ),
            const VerticalSpacerBox(size: SpacerSize.small),
            TextFieldCustom('Quantidade(em gramas)', quantController),
            ListTile(
              title: const Text(
                'Adicionar no cárdapio particular?',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              leading: Transform.scale(
                scale: 2,
                child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Radio<bool>(
                      toggleable: true,
                      activeColor: kDetailColor,
                      value: true,
                      groupValue: addMenu,
                      onChanged: (value) => setState(
                        () {
                          addMenu = value;
                        },
                      ),
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    style: FoodScreen.styleAlimentar,
                    onPressed: () => _controller.feedAnimal(type, food,
                        quantController, widget.id, context, addMenu),
                    child: const Text('Alimentar',
                        style: TextStyle(
                            color: kBackgroundColor, fontSize: kMediumSize)),
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

class MenuWidget extends StatefulWidget {
  bool addMenu;
  MenuWidget(this.addMenu, {super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  PrivateMenu? _privateMenu;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Adicionar no cárdapio particular?',
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.w900, fontSize: 20),
      ),
      leading: Transform.scale(
        scale: 2,
        child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Radio<PrivateMenu>(
              toggleable: true,
              activeColor: kDetailColor,
              value: PrivateMenu.yes,
              groupValue: _privateMenu,
              onChanged: (PrivateMenu? selecionado) => setState(
                () {
                  widget.addMenu = true;
                  _privateMenu = selecionado;
                },
              ),
            )),
      ),
    );
  }
}

class TextFieldButtonPC extends StatelessWidget {
  final String _buttonPCFieldLabel;

  const TextFieldButtonPC(this._buttonPCFieldLabel, {super.key});

  static ButtonStyle styleButton = ElevatedButton.styleFrom(
    backgroundColor: kDetailColor,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _buttonPCFieldLabel,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: kMediumLargeSize,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const VerticalSpacerBox(size: SpacerSize.small),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Selecione',
                  hintStyle: const TextStyle(fontSize: 18),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_down_sharp,
                        size: 35,
                        color: kDetailColor,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(14),
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
