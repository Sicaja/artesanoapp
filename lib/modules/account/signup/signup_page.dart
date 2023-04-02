import 'package:artesanias_app/modules/account/signup/signup_controller.dart';
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
        child: const Padding(
          padding: EdgeInsets.all(50.0),
          child: FormCreateUser(),
        ),
      ),
    );
  }
}

class FormCreateUser extends StatelessWidget {
  const FormCreateUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      initState: (_) {},
      builder: (controller) {
        return Form(
          key: controller.formKey,
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
                  TextFieldLogin(
                    labelText: 'Usuario',
                    controller: controller.userController,
                    validator: controller.httpService.validationField,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldLogin(
                    labelText: 'Contraseña',
                    controller: controller.pwdController,
                    validator: controller.httpService.validationField,
                    keyboardType: TextInputType.text,
                    obscureText: !controller.showPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.showPasswordValidation();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldLogin(
                    labelText: 'Nombre',
                    keyboardType: TextInputType.name,
                    controller: controller.nameController,
                    validator: controller.httpService.validationField,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldLogin(
                    labelText: 'Apellido',
                    keyboardType: TextInputType.name,
                    controller: controller.lastNameController,
                    validator: controller.httpService.validationField,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldLogin(
                    labelText: 'Correo electrónico',
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    validator: controller.httpService.validationField,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFieldLogin(
                            labelText: 'Edad',
                            keyboardType: TextInputType.number,
                            controller: controller.ageController,
                            validator: controller.httpService.validationField,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFieldLogin(
                            labelText: 'Género',
                            controller: controller.generController,
                            validator: controller.httpService.validationField,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButtonCustom(
                    onPressed: () {
                      controller.createUser();
                    },
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
        );
      },
    );
  }
}
