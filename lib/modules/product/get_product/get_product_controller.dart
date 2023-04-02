import 'package:artesanias_app/models/add_product_model.dart';
import 'package:get/get.dart';

class GetProductController extends GetxController {
  AddProductModel params = Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    params = Get.arguments;
    print(params.title);
    super.onInit();
  }
}
