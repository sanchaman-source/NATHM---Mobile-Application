import 'dart:async';
import 'package:dio/dio.dart';
import 'package:natham_college/auth/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final Dio dio; 
  final void Function()? onSessionExpired;

  AuthInterceptor(
    this.tokenStorage, {
    required this.dio,
    this.onSessionExpired,
  });

  Future<String?>? _refreshFuture;

  bool _isAuthPath(String path) =>
      path.contains('/auth/login') ||
      path.contains('/auth/register') ||
      path.contains('/auth/refresh');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isAuthPath(options.path)) {
      final token = await tokenStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final req = err.requestOptions;
    final is401 = err.response?.statusCode == 401;

    if (!is401 || _isAuthPath(req.path) || req.extra['retried'] == true) {
      return handler.next(err);
    }

    final newToken = await _refreshToken();
    if (newToken == null) return handler.next(err);

    try {
      req.extra['retried'] = true;
      req.headers['Authorization'] = 'Bearer $newToken';
      final response = await dio.fetch(req);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

 
  Future<String?> _refreshToken() {
    return _refreshFuture ??=
        _doRefresh().whenComplete(() => _refreshFuture = null);
  }

  Future<String?> _doRefresh() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      await _expireSession();
      return null;
    }

    try {
      final refreshDio = Dio(BaseOptions(
        baseUrl: dio.options.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ));

      final res = await refreshDio.post(
        '/auth/refresh', 
        data: {'refresh_token': refreshToken},
      );

      final data = res.data['data'];
      final newAccess = data['access_token'] as String;
      final newRefresh = (data['refresh_token'] as String?) ?? refreshToken;

      await tokenStorage.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );
      return newAccess;
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      if (code == 400 || code == 401 || code == 403 || code == 422) {
        await _expireSession();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _expireSession() async {
    await tokenStorage.clearTokens();
    onSessionExpired?.call();
  }
}