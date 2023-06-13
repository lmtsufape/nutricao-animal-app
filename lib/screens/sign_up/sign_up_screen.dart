import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/components/forms/custom_text_form_field.dart';
import 'package:thunderapp/screens/sign_up/sign_up_controller.dart';
import 'package:thunderapp/screens/sign_up/sign_up_repository.dart';

import 'package:thunderapp/shared/components/dialogs/error_dialog.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../components/buttons/primary_button.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpController()),
      ],
      builder: (context, child) {
        return Consumer<SignUpController>(
          builder: (context, controller, child) => Scaffold(
            appBar: AppBar(backgroundColor: kPrimaryColor),
            backgroundColor: kPrimaryColor,
            //Padding = espaçamento
            body: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cadastro de Usuário',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: heightScreen * kLargeSize),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Nome de exibição',
                          style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: heightScreen * kMediumSize),
                        ),
                        CustomTextFormField(
                          hintText: 'Ana Vieira',
                          controller: controller.nameController,
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'CPF',
                            style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: heightScreen * kMediumSize),
                          ),
                        ),
                        CustomTextFormField(
                          maskFormatter: cpfFormatter,
                          keyboardType: TextInputType.number,
                          hintText: '555.555.555-55',
                          controller: controller.cpfController,
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'E-mail',
                            style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: heightScreen * kMediumSize),
                          ),
                        ),
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
                          hintText: '********',
                          isPassword: true,
                          controller: controller.passwordController,
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text('Confirmar senha',
                              style: TextStyle(
                                  color: kBackgroundColor,
                                  fontSize: heightScreen * kMediumSize)),
                        ),
                        CustomTextFormField(
                          hintText: '********',
                          isPassword: true,
                          controller: controller.confirmPasswordController,
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Center(
                            child: PrimaryButton(
                                text: Text(
                                  'Finalizar',
                                  style: TextStyle(
                                      fontSize: heightScreen * kMediumSize),
                                ),
                                onPressed: () {
                                  if (validateFields(
                                      controller.nameController.text,
                                      controller.cpfController.text,
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                      controller
                                          .confirmPasswordController.text)) {
                                    SignUpRepository.signUp(
                                        controller.nameController.text,
                                        controller.cpfController.text,
                                        controller.emailController.text,
                                        controller.passwordController.text,
                                        context);
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ErrorDialog(
                                              mensage:
                                                  'Ocorreu um erro, verifique todos os campos e tente novamente');
                                        });
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
