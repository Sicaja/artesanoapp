import 'package:artesanias_app/models/add_product_model.dart';
import 'package:artesanias_app/utils/http_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();

  final httpService = HttpServices();

  void createNewProduct() async {
    if (formKey.currentState?.validate() ?? false) {
      final AddProductModel data = AddProductModel(
        title: titleController.text,
        category: 'handcraft',
        description: descriptionController.text,
        stock: 1,
        price: int.tryParse(priceController.text) != null
            ? int.parse(priceController.text)
            : 0,
        discountPercent: int.tryParse(discountController.text) != null
            ? int.parse(discountController.text)
            : 0,
      );
      final AddProductModel? response =
          await httpService.addProduct(data: data);

      if (response != null) {
        Get.offNamed(
          '/getproduct',
          arguments: response,
        );
      }
    }
  }
}
