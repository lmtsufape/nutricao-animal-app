import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/signin/components/email_form.dart';
import 'package:thunderapp/screens/signin/components/password_form.dart';
import 'package:thunderapp/screens/signin/sign_in_controller.dart';
import 'package:thunderapp/screens/signin/sign_in_model.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/selected_item.dart';

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
                    // Text(context.read<SelectedItem>().title),
                    EmailForm(onChanged: (value) => controller.email = value),
                    PasswordForm(
                        onChanged: (value) => controller.password = value),
                    controller.status == SignInStatus.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => controller.signIn(),
                            child: const Text('Entrar'))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
