import 'package:flutter/material.dart';

import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';

import 'package:thunderapp/shared/constants/app_number_constants.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../components/forms/text_field_custom.dart';

class ShareTutoringScreen extends StatelessWidget {
  const ShareTutoringScreen({Key? key}) : super(key: key);

  static ButtonStyle styleEnviar = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 16),
            child: Text(
              'Compartilhar tutoria',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: heightScreen * kHugeSize,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Name',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: heightScreen * kMediumSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 10),
            child: Text(
              'Informe o e-mail ou usuário da pessoa com quem gostaria de compartilhar a tutoria do seu pet.',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: heightScreen * kMediumLargeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          TextFieldCustom('', emailController, ''),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: widthScreen * 0.3,
                height: heightScreen * 0.040,
                child: ElevatedButton(
                  style: styleEnviar,
                  onPressed: () {},
                  child: Text(
                    'Enviar',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: heightScreen * kMediumLargeSize,
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
