import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSal = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
     appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.user),
        ),
      ]),

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
                  child: const Icon(
                    Icons.photo,
                    color: kSecondaryColor,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          TextFieldCustom('Nome de Exibição', nameController),
          TextFieldCustom('E-mail', emailController),
          TextFieldCustom('Senha', passwordController),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SizedBox(
                width: 110,
                height: 40,
                child: ElevatedButton(
                  style: styleSal,
                  onPressed: () {},
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.w700,
                        fontSize: kMediumLargeSize),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
