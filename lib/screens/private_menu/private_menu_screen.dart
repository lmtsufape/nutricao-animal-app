import 'package:flutter/material.dart';

import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

import 'package:thunderapp/shared/constants/style_constants.dart';

class PrivateMenuScreen extends StatefulWidget {
  const PrivateMenuScreen({Key? key}) : super(key: key);

  @override
  State<PrivateMenuScreen> createState() => _PrivateMenuScreenState();
}

class _PrivateMenuScreenState extends State<PrivateMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
        ),
      ]),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              'Cardápio particular',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: heightScreen * kHugeSize,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 16),
            child: Text(
              'Nome',
              style: TextStyle(color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
            ),
          ),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
          const CardMenu(),
        ],
      ),
      floatingActionButton: SizedBox(
        width: widthScreen * 0.25,
        height: heightScreen * 0.1,
        child: FloatingActionButton(
          heroTag: 'Add1',
          onPressed: () {},
          backgroundColor: kSecondaryColor,
          child: Icon(
            Icons.add,
            size: widthScreen * 0.14,
            color: kBackgroundColor,
          ),
        ),
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Screens.foodDetails),
      child: Ink(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SizedBox(
              height: heightScreen * 0.09,
              width: widthScreen * 0.94,
              child: Card(
                color: kBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'Food - Amount',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: heightScreen * kMediumLargeSize,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      subtitle: Text(
                        'Type',
                        style: TextStyle(
                            color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kDetailColor,
                          size: widthScreen * 0.06,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
