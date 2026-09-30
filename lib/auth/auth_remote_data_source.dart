import 'package:dio/dio.dart';
import 'package:natham_college/auth/user_model.dart';
import 'package:natham_college/model/login_model.dart';
import 'package:natham_college/model/api_response_model.dart';

class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource(this.dio);

  Future<LoginData> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: LoginRequest(email: email, password: password).toJson(),
      );

      final apiResponse = ApiResponse<LoginData>.fromJson(
        response.data,
        (json) => LoginData.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.success && apiResponse.data != null) {
        return apiResponse.data!;
      } else {
        throw Exception(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'Server is waking up (this can take up to a minute on first request). Please try again shortly.',
        );
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'Could not connect. Please check your internet connection.',
        );
      }

      if (e.response?.statusCode == 401) {
        final message =
            e.response?.data?['message'] ?? 'Invalid email or password.';
        throw Exception(message);
      }

      final message =
          e.response?.data?['message'] ?? 'Login failed. Please try again.';
      throw Exception(message);
    }
  }

  Future<void> logout(String refreshToken) async {
    try {
      await dio.post('/auth/logout', data: {'refresh_token': refreshToken});
    } on DioException catch (e) {
      throw Exception(e.response?.data?['message'] ?? 'Logout request failed');
    }
  }

  Future<UserModel> me() async {
    final response = await dio.get('/auth/me');
    return UserModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}
