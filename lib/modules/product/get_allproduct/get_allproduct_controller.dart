import 'package:artesanias_app/models/products_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllProductController extends GetxController {
  String name = '';
  final ProductsModel arguments = Get.arguments;

  @override
  void onInit() async {
    getName();
    super.onInit();
  }

  void getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name') ?? 'Fulano';

    update();
  }

  void showProduct({required Products product}) async {
    Get.defaultDialog(
      title: product.title ?? 'Titulo',
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      textCancel: "Cerrar",
      textConfirm: "Agregar al carrito",
      onConfirm: () {},
      content: Column(
        children: [
          Text(
            product.description ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
          Material(
            color: Colors.grey,
            shape: const CircleBorder(),
            elevation: 10.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: product.images?[0] ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
