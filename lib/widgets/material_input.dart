import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? textColor;
  const TextFieldLogin({
    required this.labelText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    this.borderColor,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        color: borderColor ?? Colors.white,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
            width: 2,
            color: borderColor ?? Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
            width: 2,
            color: borderColor ?? Colors.white,
          ),
        ),
        focusColor: borderColor ?? Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(
          color: textColor ?? Colors.grey.shade300,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
    );
  }
}
