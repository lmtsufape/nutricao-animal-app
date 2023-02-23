import 'package:flutter/material.dart';

import '../../shared/constants/style_constants.dart';

class TextFieldButton extends StatelessWidget {
  final String _buttonFieldLabel;

  const TextFieldButton(this._buttonFieldLabel, {super.key});

  static ButtonStyle styleButton = ElevatedButton.styleFrom(
    backgroundColor: kDetailColor,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _buttonFieldLabel,
                  style: const TextStyle(color: kSecondaryColor),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Selecione',
                    hintStyle: const TextStyle(fontSize: 18),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_circle_down_sharp,
                          size: 35,
                          color: kDetailColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
