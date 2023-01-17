import 'package:flutter/material.dart';
import 'package:nutricaoanimal/shared/constants/style_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final Text text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: kDetailColor),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: text,
        ),
      ),
    );
  }
}
