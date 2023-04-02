import 'package:artesanias_app/models/add_product_model.dart';
import 'package:artesanias_app/models/login_model.dart';
import 'package:artesanias_app/models/login_success_model.dart';
import 'package:artesanias_app/models/products_model.dart';
import 'package:artesanias_app/models/signup_model.dart';
import 'package:artesanias_app/models/signup_succes_model.dart';
import 'package:artesanias_app/widgets/loader.dart';
import 'package:dio/dio.dart';

class HttpServices {
  String baseUrl = 'https://dummyjson.com';
  final dio = Dio();

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    LoginModel data = LoginModel(username: username, password: password);

    LoaderArtesanal.showLoader();

    try {
      final response = await dio.post(
        '$baseUrl/auth/login',
        data: data.toJson(),
      );

      LoaderArtesanal.closeLoader();

      return LoginSuccessModel.fromJson(response.data);
    } catch (e) {
      LoaderArtesanal.closeLoader(
        hasError: true,
        errorText: "Ha ocurrido un error, verifica tus datos.",
        errorTitle: "Error al iniciar sesión",
      );
    }
  }

  Future<dynamic> createUser({required SignUpModel data}) async {
    LoaderArtesanal.showLoader();

    try {
      final response = await dio.post(
        '$baseUrl/users/add',
        data: data.toJson(),
      );

      LoaderArtesanal.closeLoader();

      return SignUpSuccessModel.fromJson(response.data);
    } catch (e) {
      LoaderArtesanal.closeLoader(
        hasError: true,
        errorText: "Ha ocurrido un error, verifica tus datos.",
        errorTitle: "Error al crear usuario",
      );
    }
  }

  Future<dynamic> addProduct({required AddProductModel data}) async {
    LoaderArtesanal.showLoader();

    try {
      final response = await dio.post(
        '$baseUrl/products/add',
        data: data.toJson(),
      );

      LoaderArtesanal.closeLoader();

      return AddProductModel.fromJson(response.data);
    } catch (e) {
      LoaderArtesanal.closeLoader(
        hasError: true,
        errorText: "Ha ocurrido un error, verifica tus datos.",
        errorTitle: "Error al crear producto",
      );
    }
  }

  Future<dynamic> getAllProducts() async {
    LoaderArtesanal.showLoader();

    try {
      final response = await dio.get('https://dummyjson.com/products');

      LoaderArtesanal.closeLoader();

      return ProductsModel.fromJson(response.data);
    } catch (e) {
      LoaderArtesanal.closeLoader(
        hasError: true,
        errorText: "Ha ocurrido un error, verifica tus datos.",
        errorTitle: "Error al obtener productos",
      );
    }
  }

  String? validationField(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'Campo requerido';

    return null;
  }
}
