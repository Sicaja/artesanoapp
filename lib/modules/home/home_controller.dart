import 'package:artesanias_app/models/products_model.dart';
import 'package:artesanias_app/utils/http_services.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String name = '';
  String photo = '';
  final zoomDrawerController = ZoomDrawerController();
  final httpService = HttpServices();

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

  void getAllProducts() async {
    final ProductsModel? response = await httpService.getAllProducts();

    if (response != null) {
      Get.toNamed('/products', arguments: response);
    }
  }
}
