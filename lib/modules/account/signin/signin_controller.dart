import 'package:artesanias_app/models/login_success_model.dart';
import 'package:artesanias_app/utils/http_services.dart';
import 'package:artesanias_app/utils/snackbar_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  final httpServices = HttpServices();
  bool showPwd = false;

  @override
  void onClose() {
    userController.dispose();
    pwdController.dispose();
    super.onClose();
  }

  void setShowPassword() {
    showPwd = !showPwd;
    update();
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      final LoginSuccessModel? response = await httpServices.login(
        username: userController.text,
        password: pwdController.text,
      );

      if (response != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token-auth', response.token ?? '');
        await prefs.setString('name', response.firstName ?? '');
        await prefs.setString('photo', response.image ?? '');
        Get.offAllNamed('/home');
        SnackBarCustom.showSnackBarMessage(
          title: "Bienvenido",
          message: "Que bueno verte de nuevo ${response.firstName}",
        );
      }
    }
  }

  String? validationField(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'Campo requerido';

    return null;
  }
}
