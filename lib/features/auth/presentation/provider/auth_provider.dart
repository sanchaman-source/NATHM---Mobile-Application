import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:natham_college/auth/auth_remote_data_source.dart';
import 'package:natham_college/auth/token_storage.dart';
import 'package:natham_college/auth/user_model.dart';
import 'package:natham_college/features/auth/domain/auth_repository.dart';
import 'package:natham_college/core/network/provider.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(AuthRemoteDataSource(ref.read(dioProvider)));
});

final tokenStorageProvider = Provider<TokenStorage>((ref) => TokenStorage());

class AuthState {
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({bool? isLoading, String? error, bool? isAuthenticated}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  final TokenStorage _tokenStorage;
  AuthController(this._repository, this._tokenStorage)
    : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final loginData = await _repository.login(email, password);

      await _tokenStorage.saveTokens(
        accessToken: loginData.accessToken,
        refreshToken: loginData.refreshToken,
      );

      state = state.copyWith(isLoading: false, isAuthenticated: true);
    } catch (e, stack) {
      debugPrint('LOGIN ERROR: $e');
      debugPrint('STACK: $stack');
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken != null) {
        await _repository.logout(refreshToken);
      }
    } catch (e) {
      debugPrint('LOGOUT API ERROR (ignored, clearing session locally): $e');
    } finally {
      await _tokenStorage.clearTokens();
      state = const AuthState();
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController(
      ref.read(authRepositoryProvider),
      ref.read(tokenStorageProvider),
    );
  },
);

final currentUserProvider = FutureProvider<UserModel>((ref) {
  return ref.watch(authRepositoryProvider).me();
});
