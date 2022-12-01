import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

enum PrivateMenu { yes, no }

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  static ButtonStyle styleAlimentar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController foodController = TextEditingController();
    TextEditingController quantController = TextEditingController();

    final AppTheme formCustom = AppTheme();
    return Scaffold(
      //appBar: formCustom.appBarCustom(context, userName!),

      body: Column(
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
          TextFieldButtonPC('Escolher do cardápio'),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
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
          TextFieldButton('Tipo'),
          TextFieldCustom('Comida', foodController),
          TextFieldCustom('Quantidade(em gramas)', quantController),
          const MenuWidget(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  style: styleAlimentar,
                  onPressed: () {},
                  child: const Text('Alimentar',
                      style: TextStyle(
                          color: kBackgroundColor, fontSize: kMediumSize)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

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
            onChanged: (PrivateMenu? value) {
              setState(() {
                _privateMenu = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class TextFieldButtonPC extends StatelessWidget {
  final String _buttonPCFieldLabel;

  TextFieldButtonPC(this._buttonPCFieldLabel);

  static ButtonStyle styleButton = ElevatedButton.styleFrom(
    backgroundColor: kDetailColor,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
