import 'package:artesanias_app/modules/account/signin/signin_bindings.dart';
import 'package:artesanias_app/modules/account/signin/signin_page.dart';
import 'package:artesanias_app/modules/account/signup/signup_page.dart';
import 'package:artesanias_app/modules/home/home_page.dart';
import 'package:artesanias_app/modules/product/add_product/add_product_page.dart';
import 'package:artesanias_app/modules/product/get_product/get_product_page.dart';
import 'package:artesanias_app/modules/splash/splash_binding.dart';
import 'package:artesanias_app/modules/splash/splash_page.dart';
import 'package:get/route_manager.dart';

abstract class AppRoutesList {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: '/splash',
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/signin',
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: '/addproduct',
      page: () => const AddProductPage(),
    ),
    GetPage(
      name: '/getproduct',
      page: () => const GetProductPage(),
    ),
  ];
}
