import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      this.label,
      this.controller,
      this.maskFormatter,
      this.keyboardType,
      this.hintText,
      this.isPassword})
      : super(key: key);
  final String? label;
  final MaskTextInputFormatter? maskFormatter;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;
  @override
  void initState() {
    if (widget.isPassword != null) {
      _obscureText = widget.isPassword!;
    }
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        inputFormatters:
            widget.maskFormatter == null ? null : [widget.maskFormatter!],
        obscureText: _obscureText,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          labelText: widget.label,
          filled: true,
          fillColor: kBackgroundColor.withOpacity(0.65),
          hintText: widget.hintText,
          suffixIcon: widget.isPassword == true
              ? InkWell(
                  onTap: () => _toggleVisibility(),
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
