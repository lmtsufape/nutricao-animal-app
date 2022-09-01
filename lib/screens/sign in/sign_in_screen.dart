import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/components/buttons/primary_button.dart';
import 'package:thunderapp/components/forms/custom_text_form_field.dart';
import 'package:thunderapp/components/utils/vertical_spacer_box.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign%20in/sign_in_controller.dart';

import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../shared/constants/app_enums.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignInController()),
        ],
        builder: (context, child) {
          return Consumer<SignInController>(
            builder: (context, controller, child) => Scaffold(
              backgroundColor: kPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text('E-mail',
                        style: TextStyle(color: kBackgroundColor)),
                    CustomTextFormField(
                      hintText: 'email@example.com',
                      controller: controller.emailController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const Text('Senha',
                        style: TextStyle(color: kBackgroundColor)),
                    CustomTextFormField(
                      hintText: 'Sua senha',
                      isPassword: true,
                      controller: controller.passwordController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    controller.errorMessage != null
                        ? Text(
                            controller.errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          )
                        : const SizedBox(),
                    controller.status == SignInStatus.loading
                        ? const CircularProgressIndicator()
                        : PrimaryButton(
                            text: 'Continuar',
                            onPressed: () => controller.signIn(context)),
                    Row(
                      children: <Widget>[
                        TextButton(
                          child: const Text('Ou cadastre-se'),
                          style: TextButton.styleFrom(primary: kDetailColor),
                          onPressed: () {
                            Navigator.pushNamed(context, Screens.signup);
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
