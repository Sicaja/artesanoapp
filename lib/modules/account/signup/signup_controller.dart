import 'package:artesanias_app/models/signup_model.dart';
import 'package:artesanias_app/models/signup_succes_model.dart';
import 'package:artesanias_app/utils/http_services.dart';
import 'package:artesanias_app/utils/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final generController = TextEditingController();
  final httpService = HttpServices();
  bool showPassword = false;

  void showPasswordValidation() {
    showPassword = !showPassword;
    update();
  }

  void createUser() async {
    if (formKey.currentState?.validate() ?? false) {
      final SignUpModel data = SignUpModel(
          firstName: nameController.text,
          username: userController.text,
          password: pwdController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          age: int.tryParse(ageController.text) != null
              ? int.parse(ageController.text)
              : 0,
          gender: generController.text);

      final SignUpSuccessModel? response =
          await httpService.createUser(data: data);

      if (response != null) {
        SnackBarCustom.showSnackBarMessage(
          title: 'Éxito',
          message:
              "Se ha creado correctamente el usuario: ${response.id}: ${response.lastName}",
        );
        Get.offNamed('/signin');
      }
    }
  }
}
