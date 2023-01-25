import 'package:flutter/material.dart';

import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';

import 'package:thunderapp/shared/constants/app_number_constants.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';

class ShareTutoringScreen extends StatelessWidget {
  const ShareTutoringScreen({Key? key}) : super(key: key);

  static ButtonStyle styleEnviar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 16),
            child: Text(
              'Compartilhar tutoria',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: kHugeSize,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Name',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: kMediumSize,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 10),
            child: Text(
              'Informe o e-mail ou usuário da pessoa com quem gostaria de compartilhar a tutoria do seu pet.',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kMediumLargeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          TextFieldCustom('', emailController),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: 110,
                height: 40,
                child: ElevatedButton(
                  style: styleEnviar,
                  onPressed: () {},
                  child: const Text(
                    'Enviar',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: kMediumLargeSize,
                        fontWeight: FontWeight.w700),
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
