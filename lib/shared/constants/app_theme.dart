import 'package:flutter/cupertino.dart';
import 'package:thunderapp/app.dart';
import 'package:flutter/material.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: kDefaultFontFamily,
    );
  }
}

AppBar AppBarCustom(BuildContext context) {
  return AppBar(title: const Text('Olá Ana!'), actions: [
    IconButton(
      icon: const Icon(Icons.account_circle_rounded),
      onPressed: () => Navigator.pushNamed(context, Screens.user),
    ),
  ]);
}

class NavigationDrawerWidget extends StatelessWidget {

  static ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: kDetailColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: Drawer(
        backgroundColor: kSecondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: ListTile(
                leading: Icon(Icons.portrait_rounded, color: kBackgroundColor, size: 125,),
                title: Padding(
                  padding: EdgeInsets.only(top: 37),
                  child: Text('Ana Vieira', style: TextStyle(color: kBackgroundColor, fontSize: 27, fontWeight: FontWeight.w900),),
                ),
                subtitle: Text('example@email.com', style: TextStyle(color: kBackgroundColor, fontSize: kMediumSize, fontWeight: FontWeight.w500),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Center(
                child: SizedBox(
                  width: 215,
                  child: ElevatedButton.icon(
                    style: style,
                    onPressed: () => Navigator.pushNamed(context, Screens.editProfile),
                    icon: const Icon(Icons.edit_rounded, color: kBackgroundColor,),
                    label: const Text('Editar informações', style: TextStyle(color: kBackgroundColor, fontSize: kMediumSize, fontWeight: FontWeight.w600),),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:3,
                  width:335,
                  color: kBackgroundColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Sugerir nova comida', style: TextStyle(color: kBackgroundColor, fontSize: kHugeSize, fontWeight: FontWeight.w900),),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      onTap: (){},
                      title: const Text('Lorem ipsum', style: TextStyle(color: kBackgroundColor, fontSize: kHugeSize, fontWeight: FontWeight.w900),),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Lorem ipsum', style: TextStyle(color: kBackgroundColor, fontSize: kHugeSize, fontWeight: FontWeight.w900),),
                    ),
                  ),
                   ListTile(
                     onTap: () {},
                     title: const Text('Lorem ipsum', style: TextStyle(color: kBackgroundColor, fontSize: kHugeSize, fontWeight: FontWeight.w900),),
                     ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(onPressed: () {}, child: const Text('Sair', style: TextStyle(color: kBackgroundColor, fontSize: 28),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220),
                      child: IconButton(onPressed: () {}, icon: const Icon(Icons.door_back_door_outlined, color: kBackgroundColor, size: 40,)),
                    ),
                  ],
              ),
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

