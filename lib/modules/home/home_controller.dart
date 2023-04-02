import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String name = '';
  String photo = '';
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onInit() async {
    getName();
    super.onInit();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name') ?? 'Fulano';
    photo = prefs.getString('photo') ?? '';

    update();
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token-auth');
    await prefs.remove('name');
    await prefs.remove('photo');
    Get.offNamed('/signin');
  }
}
