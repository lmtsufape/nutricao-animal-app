import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final Text text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kDetailColor),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
          child: text,
        ),
      ),
    );
  }
}
