import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/components/forms/custom_text_form_field.dart';
import 'package:thunderapp/screens/sign%20up/sign_up_controller.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../components/buttons/primary_button.dart';
import '../../components/utils/vertical_spacer_box.dart';
import '../../shared/constants/app_enums.dart';
import '../screens_index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(
                      'Cadastro de Usuário',
                      style: TextStyle(
                          color: kBackgroundColor, fontSize: kLargeSize),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Nome de exibição',
                      style: TextStyle(color: kBackgroundColor),
                    ),
                    const CustomTextFormField(
                      hintText: 'Ana Vieira',
                      // controller: controller.nomeController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const Text(
                      'E-mail',
                      style: TextStyle(color: kBackgroundColor),
                    ),
                    const CustomTextFormField(
                      hintText: 'email@example.com',
                      // controller: controller.emailController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const Text('Senha',
                        style: TextStyle(color: kBackgroundColor)),
                    const CustomTextFormField(
                      hintText: '********',
                      //  isPassword: true,
                      // controller: controller.passwordController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const Text('Confirmar senha',
                        style: TextStyle(color: kBackgroundColor)),
                    const CustomTextFormField(
                      hintText: '********',
                      //isPassword: true,
                      // controller: controller.passwordController,
                    ),
                    const VerticalSpacerBox(size: SpacerSize.small),
                    const SizedBox(
                      height: kMediumSize,
                    ),
                    Center(
                      child: PrimaryButton(
                          text: const Text(
                            'Finalizar',
                            style: TextStyle(fontSize: kMediumLargeSize),
                          ),
                          //Criar rota
                          onPressed: () => controller.signUp(context)),
                    ),
                    const Spacer(),
                  ],
                )),
          ),
        );
      },
    );
  }
}
