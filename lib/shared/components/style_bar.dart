import 'package:flutter/material.dart';

import '../constants/style_constants.dart';

class StyleBar extends StatelessWidget {
  final String title;
  final bool hasLeading;
  const StyleBar({Key? key, required this.title, required this.hasLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: hasLeading,
      flexibleSpace: SizedBox(
        height: size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kTitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: kDetailColor,
    );
  }
}
