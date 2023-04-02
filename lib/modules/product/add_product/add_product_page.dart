import 'package:artesanias_app/utils/colors_app.dart';
import 'package:artesanias_app/widgets/material_button_custom.dart';
import 'package:artesanias_app/widgets/material_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_product_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
      init: AddProductController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF8E1C18),
            centerTitle: true,
            title: const Text("Agregar Productos"),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Hero(
                      tag: 'tipico',
                      child: Image.asset(
                        'assets/background-splash.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldLogin(
                      labelText: "Titulo",
                      borderColor: const Color(0xFF0A1132),
                      textColor: const Color(0xFF0A1132),
                      validator: controller.httpService.validationField,
                      controller: controller.titleController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldLogin(
                      labelText: "Descripción",
                      borderColor: const Color(0xFF0A1132),
                      textColor: const Color(0xFF0A1132),
                      validator: controller.httpService.validationField,
                      controller: controller.descriptionController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldLogin(
                      labelText: "Precio",
                      borderColor: const Color(0xFF0A1132),
                      textColor: const Color(0xFF0A1132),
                      validator: controller.httpService.validationField,
                      controller: controller.priceController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldLogin(
                      labelText: "Descuento",
                      borderColor: const Color(0xFF0A1132),
                      textColor: const Color(0xFF0A1132),
                      validator: controller.httpService.validationField,
                      controller: controller.discountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButtonCustom(
                      onPressed: controller.createNewProduct,
                      textButton: 'Enviar',
                      color: ColorsCustom.colorPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
