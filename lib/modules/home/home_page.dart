import 'package:artesanias_app/modules/home/home_controller.dart';
import 'package:artesanias_app/utils/colors_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (controller) {
        return ZoomDrawer(
          angle: 0,
          androidCloseOnBackTap: true,
          menuBackgroundColor: Colors.grey.shade400,
          controller: controller.zoomDrawerController,
          menuScreen: MenuScreen(
            controller: controller,
          ),
          mainScreen: MainScreen(
            controller: controller,
          ),
        );
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  final HomeController controller;

  const MenuScreen({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Drawer(
        backgroundColor: Colors.grey.shade400,
        shadowColor: Colors.transparent,
        child: SafeArea(
          child: SizedBox(
            height: context.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerHeaderCustom(controller: controller),
                      MenuOpt(
                        iconData: Icons.home_filled,
                        title: 'Inicio',
                        onTap: () {},
                      ),
                      Visibility(
                        visible: controller.name == 'Mavis',
                        child: MenuOpt(
                          iconData: Icons.add,
                          title: 'Agregar producto',
                          onTap: () {
                            Get.toNamed('/addproduct');
                            controller.toggleDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Visibility(
                          child: MenuOpt(
                            iconData: Icons.logout,
                            title: 'Salir',
                            onTap: controller.logout,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final HomeController controller;
  const MainScreen({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E1C18),
        centerTitle: true,
        title: Text("Bienvenido ${controller.name}"),
        leading: IconButton(
          onPressed: controller.toggleDrawer,
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}

class MenuOpt extends StatelessWidget {
  const MenuOpt({
    Key? key,
    required this.iconData,
    required this.title,
    this.active = false,
    this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String title;
  final bool active;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerHeaderCustom extends StatelessWidget {
  final HomeController controller;

  const DrawerHeaderCustom({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (home) {
        return DrawerHeader(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorsCustom.colorPrimary,
                width: 0.2,
              ),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.grey,
                    shape: const CircleBorder(),
                    elevation: 10.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CachedNetworkImage(
                          imageUrl: controller.photo,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  controller.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
