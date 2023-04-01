import 'dart:async';

import 'package:artesanias_app/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  void onClose() {
    userController.dispose();
    pwdController.dispose();
    super.onClose();
  }

  void login() {
    LoaderArtesanal.showLoader();
    Timer(
      const Duration(seconds: 2),
      () {
        Get.back();
      },
    );
  }

  String? validationField(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'Campo requerido';

    return null;
  }
}
