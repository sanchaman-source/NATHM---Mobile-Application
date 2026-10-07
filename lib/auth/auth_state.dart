import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:natham_college/auth/token_storage.dart';

enum AuthStatus { unknown, guest, authenticated }

class AuthState {
  final AuthStatus status;
  const AuthState(this.status);

  bool get isLoggedIn => status == AuthStatus.authenticated;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState(AuthStatus.unknown)) {
    _init();
  }

  final TokenStorage _tokenStorage = TokenStorage();

  Future<void> _init() async {
    final token = await _tokenStorage.getAccessToken();
    state = (token != null && token.isNotEmpty)
        ? const AuthState(AuthStatus.authenticated)
        : const AuthState(AuthStatus.guest);
  }

  void markAuthenticated() => state = const AuthState(AuthStatus.authenticated);
  void markGuest() => state = const AuthState(AuthStatus.guest);
}

final authStateProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
    
    final sessionExpiredCountProvider = StateProvider<int>((ref) => 0);


    final appContainer = ProviderContainer();