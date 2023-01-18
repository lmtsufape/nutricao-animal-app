import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: kTextButtonColor),
              borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: kBody2.copyWith(color: kSecondaryColor),
        ),
      ),
    );
  }
}
