import 'package:dio/dio.dart';
import 'package:natham_college/auth/auth_interceptor.dart';
import 'package:natham_college/auth/login_page.dart';
import 'package:natham_college/auth/token_storage.dart';
import 'package:get/get.dart';

class DioClient {
  static const String baseUrl = 'https://nathm-backend.onrender.com/api/v1';

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(AuthInterceptor(TokenStorage(), dio: dio, onSessionExpired: () => Get.offAll(() => LoginPage())));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
