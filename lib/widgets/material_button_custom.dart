import 'package:artesanias_app/utils/colors_app.dart';
import 'package:flutter/material.dart';

class MaterialButtonCustom extends StatelessWidget {
  final Function() onPressed;
  final Color? color;
  final String textButton;
  const MaterialButtonCustom({
    required this.onPressed,
    this.color,
    required this.textButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      color: color ?? ColorsCustom.colorPrimary,
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Text(
        textButton,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
