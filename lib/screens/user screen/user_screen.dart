import 'package:flutter/material.dart';
import 'package:nutricaoanimal/components/buttons/primary_button.dart';
import 'package:nutricaoanimal/screens/user%20screen/user_screen_controller.dart';


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
