import 'package:flutter_application_2/core/network/api_endpoints.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_remote_data_source.dart';
import 'package:flutter_application_2/features/Auth/data/models/auth_model.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final IApiConsumer api;

  AuthRemoteDataSourceImp(this.api);
  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final response = await api.post(
        ApiEndpoints.login,
        body: {"email": email, "password": password},
      );
      final authModel = AuthModel.fromJson(response);

      return authModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> register(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    final response = await api.post(
      ApiEndpoints.register,
      body: {
        'full_name': username,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    final authModel = AuthModel.fromJson(response);
    return authModel;
  }
}
