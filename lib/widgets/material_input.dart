import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const TextFieldLogin({
    required this.labelText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
        focusColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey.shade300,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
    );
  }
}
