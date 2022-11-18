import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key? key, required this.onChanged}) : super(key: key);
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(),
      ),
      onChanged: onChanged,
      obscureText: true,
    );
  }
}
