import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/signin/sign_in_controller.dart';
import 'package:thunderapp/screens/signin/sign_in_model.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignInController(context)),
        ],
        builder: (context, child) {
          return Consumer<SignInController>(
            builder: (context, controller, child) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Tela de login'),
                    Text(controller.email),
                    TextFormField(
                      onChanged: (value) => controller.email = value,
                      decoration: const InputDecoration(
                        fillColor: kPrimaryColor,
                        border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) =>
                          context.read<SignInController>().password = value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: kPrimaryColor,
                        filled: true,
                        labelText: 'Senha',
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Screens.home),
                        child: const Text('Entrar'))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
