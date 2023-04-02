import 'package:artesanias_app/modules/account/signin/signin_controller.dart';
import 'package:artesanias_app/widgets/material_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: const SafeArea(
          child: FormSignInWidget(),
        ),
      ),
    );
  }
}

class FormSignInWidget extends GetView<SignInController> {
  const FormSignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Text(
              'Inicio de sesión',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 37,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
            child: TextFieldLogin(
              controller: controller.userController,
              labelText: 'Usuario',
              validator: controller.validationField,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
            child: FieldPassword(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
            child: MaterialButton(
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: const Color(0xFF0A548F),
              minWidth: double.infinity,
              onPressed: () {
                controller.login();
              },
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "No tienes cuenta?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/signup');
                },
                child: const Text(
                  "Crear una aquí",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FieldPassword extends StatelessWidget {
  const FieldPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      initState: (_) {},
      builder: (contro) {
        return TextFieldLogin(
          controller: contro.pwdController,
          labelText: 'Contraseña',
          obscureText: !contro.showPwd,
          validator: contro.validationField,
          suffixIcon: IconButton(
            icon: Icon(
              contro.showPwd ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: () {
              contro.setShowPassword();
            },
          ),
        );
      },
    );
  }
}
