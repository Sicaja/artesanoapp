import 'package:artesanias_app/modules/product/get_allproduct/get_allproduct_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GetAllProductsPage extends StatelessWidget {
  const GetAllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAllProductController>(
      init: GetAllProductController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF8E1C18),
            centerTitle: true,
            title: Text("Bienvenido ${controller.name}"),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final product = controller.arguments.products![index];
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Material(
                        color: Colors.grey,
                        shape: const CircleBorder(),
                        elevation: 10.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: CachedNetworkImage(
                              imageUrl: product.thumbnail ?? '',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        controller.arguments.products![index].title ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        product.description ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.showProduct(product: product);
                      },
                      child: const Text(
                        'Ver Detalle',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.arguments.products?.length ?? 0,
          ),
        );
      },
    );
  }
}
