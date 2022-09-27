import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSal = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarCustom(context),
      drawer: NavigationDrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 25),
            child: Center(
              child: SizedBox(
                width: 130,
                height: 130,
                child: FloatingActionButton(
                  backgroundColor: kBackgroundColor,
                  onPressed: () {},
                  child: const Icon(Icons.photo, color: kSecondaryColor, size: 50,),
                ),
              ),
            ),
          ),
          TextFieldCustom('Nome de Exibição'),
          TextFieldCustom('E-mail'),
          TextFieldCustom('Senha'),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SizedBox(
                width: 110,
                height: 40,
                child: ElevatedButton(
                    style: styleSal,
                    onPressed: () {},
                    child: const Text('Salvar', style: TextStyle(color: kBackgroundColor, fontWeight: FontWeight.w700, fontSize: kMediumLargeSize),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
