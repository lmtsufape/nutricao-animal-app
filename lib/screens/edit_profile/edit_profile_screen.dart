import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/edit_profile/edit_profile_controller.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

import '../../components/forms/text_field_custom.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static ButtonStyle styleSal = ElevatedButton.styleFrom(
    backgroundColor: kSecondaryColor,
  );

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late String userName;
  late String email;

  Future<String> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name')!;
    return userName;
  }

  Future<String> _getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')!;
    return email;
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    EditProfileController editController = EditProfileController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.user),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 25),
              child: Center(
                child: SizedBox(
                  width: widthScreen * 0.4,
                  height: heightScreen * 0.12,
                  child: FloatingActionButton(
                    heroTag: 'Photo',
                    backgroundColor: kBackgroundColor,
                    onPressed: () {},
                    child: Icon(
                      Icons.photo,
                      color: kSecondaryColor,
                      size: widthScreen * 0.10,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome de Exibição',
                    style: TextStyle(
                        color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'asda',
                      contentPadding: EdgeInsets.all(14),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            TextFieldCustom('E-mail', emailController),
            TextFieldCustom('Senha', passwordController),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: SizedBox(
                  width: widthScreen * 0.3,
                  height: heightScreen * 0.040,
                  child: ElevatedButton(
                    style: EditProfileScreen.styleSal,
                    onPressed: () {},
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                          color: kBackgroundColor,
                          fontWeight: FontWeight.w700,
                          fontSize: heightScreen * kMediumLargeSize),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => editController.logoff(context),
                color: kDetailColor,
                child: const Text('Log Off'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
