import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt counter = 10.obs;

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.toNamed('/home');
      },
    );
    super.onInit();
  }

  void counterAdd() {
    counter++;
    update();
    print('Hola mundo');
  }
}
