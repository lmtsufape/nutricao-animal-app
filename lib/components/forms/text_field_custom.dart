import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

import '../../shared/constants/style_constants.dart';

class TextFieldCustom extends StatelessWidget {
  final String _fieldLabel;
  final TextEditingController controller;
  final String label;

  const TextFieldCustom(this._fieldLabel, this.controller, this.label,
      {super.key});

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
                color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: Text(label),
              contentPadding: EdgeInsets.all(14),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
