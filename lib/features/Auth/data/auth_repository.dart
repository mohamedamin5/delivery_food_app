import 'package:flutter_application_2/core/network/api_endpoints.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/services/storage_service.dart';

class AuthRepository {
  final IApiConsumer api;
  final StorageService storage;
  AuthRepository(this.api, this.storage);

  Future<String> login(String email, String password) async {
    try {
      final response = await api.post(
        ApiEndpoints.login,
        queryParameters: {'email': email, 'password': password},
      );
      if (response["access_token"] != null &&
          response["refresh_token"] != null) {
        await storage.save('access_token', response['access_token']);
        await storage.save('refresh_token', response['refresh_token']);
        return response['access_token'];
      } else {
        throw Exception(
          'Invalid response: access_token not found or is not a string',
        );
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<String> register(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    try {
      final response = await api.post(
        ApiEndpoints.register,
        queryParameters: {
          'username': username,
          'password': password,
          'email': email,
          'phone': phone,
        },
      );
      if (response["access_token"] != null &&
          response["refresh_token"] != null) {
        await storage.save('access_token', response['access_token']);
        await storage.save('refresh_token', response['refresh_token']);
        return response['access_token'];
      } else {
        throw Exception(
          'Invalid response: access_token not found or is not a string',
        );
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
}
