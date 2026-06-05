import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_remote_data_source_imp.dart';

class AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSourceImp remoteDataSource;

  AuthRepository(this.localDataSource, this.remoteDataSource);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(email, password);
      await localDataSource.saveAuthData(
        response.accessToken,
        response.refreshToken,
        response.role,
        response.userId,
      );

      return response.role;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<String> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await remoteDataSource.register(
        username,
        password,
        email,
        phone,
      );

      await localDataSource.saveAuthData(
        response.accessToken,
        response.refreshToken,
        response.role,
        response.userId,
      );
      return response.role;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
}
