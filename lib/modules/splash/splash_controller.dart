import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  RxInt counter = 10.obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 1), () {
      verifyToken();
    });
    super.onInit();
  }

  void verifyToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token-auth');
    if (token != null) {
      Get.offAndToNamed('/home');
    } else {
      Get.offAndToNamed('/signin');
    }
  }
}
