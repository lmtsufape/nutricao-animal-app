import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thunderapp/screens/add_animal/add_animal_screen.dart';
import 'package:thunderapp/screens/edit_profile/edit_profile_controller.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

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
    EditProfileController editController = EditProfileController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                      color: kSecondaryColor, fontSize: heightScreen * 0.016),
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
                width: 110,
                height: 40,
                child: ElevatedButton(
                  style: EditProfileScreen.styleSal,
                  onPressed: () {},
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.w700,
                        fontSize: kMediumLargeSize),
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
    );
  }
}
