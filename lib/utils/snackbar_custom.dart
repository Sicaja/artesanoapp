import 'package:get/get.dart';

abstract class SnackBarCustom {
  static showSnackBarMessage({
    required String title,
    required String message,
  }) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 20),
    ));
  }
}
