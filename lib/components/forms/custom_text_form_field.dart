import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,  this.label, this.controller, this.keyboardType, this.obscureText, this.hintText, this.isPassword}) : super(key: key);
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              
          ),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          
        ),
      ),
    );
  }
}