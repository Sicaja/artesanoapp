import 'package:artesanias_app/models/login_model.dart';
import 'package:artesanias_app/models/login_success_model.dart';
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
}
