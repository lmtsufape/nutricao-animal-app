import 'package:flutter/material.dart';

import 'package:thunderapp/components/utils/vertical_spacer_box.dart';
import 'package:thunderapp/screens/user%20screen/user_screen_controller.dart';
import 'package:thunderapp/shared/constants/app_enums.dart';
import '../../shared/constants/app_number_constants.dart';

import '../../shared/constants/style_constants.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    // final AppTheme formCustom = AppTheme();
    final UserScreenController controller = UserScreenController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfil'),
      ),
      body: Column(
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
          const VerticalSpacerBox(size: SpacerSize.huge),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Nome:',
              style: kUser,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text('userName', style: kUserText),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Email:',
              style: kUser,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'email',
              style: kUserText,
            ),
          ),
          const VerticalSpacerBox(size: SpacerSize.huge),
          const VerticalSpacerBox(size: SpacerSize.huge),
          const VerticalSpacerBox(size: SpacerSize.huge),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SizedBox(
                width: widthScreen * 0.4,
                height: heightScreen * 0.04,
                child: ElevatedButton(
                  style: styleSal,
                  onPressed: () => controller.logoff(context),
                  child: Text(
                    'Log Off',
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.w700,
                        fontSize: heightScreen * kMediumLargeSize),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
