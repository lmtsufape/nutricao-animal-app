import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thunderapp/components/buttons/primary_button.dart';
import 'package:thunderapp/screens/user%20screen/user_screen_controller.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserScreenController controller = UserScreenController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PrimaryButton(
            text: const Text("Log off"),
            onPressed: () => controller.logoff(context)),
      ),
    );
  }
}
