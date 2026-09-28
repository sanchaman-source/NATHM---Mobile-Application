import 'package:natham_college/auth/auth_remote_data_source.dart';
import 'package:natham_college/auth/user_model.dart';
import 'package:natham_college/model/login_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepository(this._remoteDataSource);
   Future<LoginData> login(String email, String password) {
    return _remoteDataSource.login(email, password);
  } 

  Future<void> logout(String refreshToken) => _remoteDataSource.logout(refreshToken);

  Future<UserModel> me() => _remoteDataSource.me();
}