import 'package:flutter/material.dart';

import '../../shared/constants/style_constants.dart';

class TextFieldCustom extends StatelessWidget {
  final String _fieldLabel;
  final TextEditingController controller;

  const TextFieldCustom(this._fieldLabel, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _fieldLabel,
            style: TextStyle(
                color: kSecondaryColor, fontSize: heightScreen * 0.016),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(14),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
