import 'package:artesanias_app/utils/colors_app.dart';
import 'package:artesanias_app/widgets/material_button_custom.dart';
import 'package:artesanias_app/widgets/material_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff091132),
              Color(0xff806000),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Crear usuario",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const TextFieldLogin(
                    labelText: 'Usuario',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldLogin(
                    labelText: 'Contraseña',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("Wenas");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFieldLogin(
                    labelText: 'Nombre',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFieldLogin(
                    labelText: 'Apellido',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TextFieldLogin(
                    labelText: 'Correo electrónico',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Flexible(
                          flex: 1,
                          child: TextFieldLogin(
                            labelText: 'Edad',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFieldLogin(
                            labelText: 'Género',
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButtonCustom(
                    onPressed: () {},
                    textButton: 'Crear usuario',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButtonCustom(
                    onPressed: () {
                      Get.back();
                    },
                    textButton: 'Regresar',
                    color: ColorsCustom.colorSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
