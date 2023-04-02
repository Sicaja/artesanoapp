import 'package:artesanias_app/modules/splash/splash_controller.dart';

import 'package:get/instance_manager.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
