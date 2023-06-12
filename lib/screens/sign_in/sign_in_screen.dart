import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/components/buttons/primary_button.dart';
import 'package:thunderapp/components/forms/custom_text_form_field.dart';
import 'package:thunderapp/components/utils/vertical_spacer_box.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign_in/sign_in_controller.dart';

import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/user_model.dart';

import '../../shared/constants/app_enums.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    //SignInRepository repository = SignInRepository();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignInController>(
              create: (BuildContext context) {
            return SignInController();
          }),
          ChangeNotifierProvider<UserModel>.value(value: userModel),
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
                    const Center(
                      child: Image(
                          image: AssetImage(
                              '/home/rievvy/Documentos/nutricao-animal-app/lib/assets/images/logo.png')),
                    ),
                    Text('E-mail',
                        style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: heightScreen * kMediumSize)),
                    CustomTextFormField(
                      hintText: 'email@example.com',
                      controller: controller.emailController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Senha',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: heightScreen * kMediumSize)),
                    ),
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
                        : Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Center(
                              child: PrimaryButton(
                                  text: Text(
                                    'Entrar',
                                    style: TextStyle(
                                        fontSize:
                                            heightScreen * kMediumLargeSize),
                                  ),
                                  onPressed: () => controller.signIn(
                                      context,
                                      controller.email.toString(),
                                      controller.password.toString())),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: kDetailColor),
                          onPressed: () {
                            Navigator.pushNamed(context, Screens.signup);
                          },
                          child: Text(
                            'Ou cadastre-se',
                            style: TextStyle(
                                fontSize: heightScreen * kMediumSize,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
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
