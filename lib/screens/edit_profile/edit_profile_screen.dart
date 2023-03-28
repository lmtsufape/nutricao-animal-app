import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/edit_profile/edit_profile_controller.dart';
import 'package:thunderapp/screens/edit_profile/edit_profile_repository.dart';
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
  EditProfileController controller = EditProfileController();
  late String userName;
  late String email;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<String>? _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('name')!;
    nameController.text = userName;
    return userName;
  }

  Future<String> _getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')!;
    emailController.text = email;
    return email;
  }

  @override
  void initState() {
    _getUserName();
    _getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 25),
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 130,
                  child: FloatingActionButton(
                    backgroundColor: kBackgroundColor,
                    onPressed: () {},
                    child: const Icon(
                      Icons.photo,
                      color: kSecondaryColor,
                      size: 50,
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
                        color: kSecondaryColor,
                        fontSize: heightScreen * kMediumSize),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.all(14),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: heightScreen * kMediumSize),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.all(14),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            TextFieldCustom('Senha', passwordController, '***********'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: SizedBox(
                  width: widthScreen * 0.3,
                  height: heightScreen * 0.040,
                  child: ElevatedButton(
                    style: EditProfileScreen.styleSal,
                    onPressed: () => controller.editUser(
                        nameController, emailController, context),
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
                onPressed: () => controller.logoff(context),
                color: kDetailColor,
                child: const Text('Log Off'),
              ),
            ),
          ],
        ));
  }
}
