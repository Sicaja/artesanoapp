import 'package:artesanias_app/modules/product/get_product/get_product_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GetProductPage extends StatelessWidget {
  const GetProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetProductController>(
      init: GetProductController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF8E1C18),
            centerTitle: true,
            title: const Text("Producto"),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                leading: const LeadingImage(),
                title: Text(
                  controller.params.title ?? 'Title',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  controller.params.description ?? "Description",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LeadingImage extends StatelessWidget {
  const LeadingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: Material(
        shape: const CircleBorder(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Hero(
            tag: 'tipico',
            child: Image.asset(
              'assets/background-splash.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
