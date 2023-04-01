import 'package:flutter/material.dart';

class MaterialInputCustom extends StatelessWidget {
  const MaterialInputCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        labelText: 'Usuario',
      ),
    );
  }
}
