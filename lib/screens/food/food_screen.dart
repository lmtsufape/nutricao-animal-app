import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/components/utils/vertical_spacer_box.dart';
import 'package:thunderapp/screens/food/food_controller.dart';
import 'package:thunderapp/screens/food/food_repository.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/user_model.dart';

import '../../components/forms/text_field_custom.dart';
import '../../shared/core/models/animal_model.dart';
import '../../shared/core/models/food_model.dart';
import '../screens_index.dart';

enum PrivateMenu { yes, no }

// ignore: must_be_immutable
class FoodScreen extends StatefulWidget {
  AnimalModel animal;
  FoodScreen(this.animal, {Key? key}) : super(key: key);

  static ButtonStyle styleAlimentar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late Future<List<FoodModel>> listFoodModel;
  final FoodController _controller = FoodController();
  final UserModel user = UserModel();
  late String userName;
  final FoodRepository _repository = FoodRepository();
  String type = 'Ração';
  String food = 'Selecione';
  TextEditingController quantController = TextEditingController();
  late Future<List<String>> listFoods;
  late Future<List<String>> listTypes;
  bool? addMenu;

  @override
  void initState() {
    listFoodModel = _repository.populateListFoods();
    listFoods = _repository.showFoods(type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
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
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Alimentar',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: heightScreen * kHugeSize,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: Text(widget.animal.name,
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: heightScreen * kMediumSize)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                'Tipo',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
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
                asyncItems: (String categories) => _repository.showCategories(),
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
              padding: const EdgeInsets.only(left: 16, top: 20),
              child: Text(
                'Comida',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: heightScreen * kMediumSize),
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
                asyncItems: (String foods) => _repository.showFoods(type),
                onChanged: (data) {
                  setState(
                    () {
                      food = data.toString();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child:
                  TextFieldCustom('Quantidade(em gramas)', quantController, ''),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: SizedBox(
                  width: widthScreen * 0.4,
                  height: heightScreen * 0.040,
                  child: ElevatedButton(
                    style: FoodScreen.styleAlimentar,
                    onPressed: () => _controller.feedAnimal(type, food,
                        quantController, widget.animal, context, addMenu),
                    child: Text('Alimentar',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: heightScreen * kMediumSize)),
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
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return ListTile(
      title: Text(
        'Adicionar no cárdapio particular?',
        style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w900,
            fontSize: heightScreen * 0.020),
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
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
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
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: heightScreen * kMediumLargeSize,
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
