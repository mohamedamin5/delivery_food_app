import 'package:flutter_application_2/core/consts/storage_keys.dart';

import 'package:flutter_application_2/core/network/api_endpoints.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_source.dart';

class AuthRepository {
  final IApiConsumer api;
  final SecureStorageDataSource storage;

  AuthRepository(this.api, this.storage);

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await api.post(
        ApiEndpoints.login,
        body: {"email": email, "password": password},
      );
      if (response[StorageKeys.accessToken] != null &&
          response[StorageKeys.refershToken] != null) {
        final access = response[StorageKeys.accessToken];
        final refersh = response[StorageKeys.accessToken];

        await storage.save(StorageKeys.refershToken, refersh);
        await storage.save(StorageKeys.accessToken, access);
      } else {
        throw Exception(
          'Invalid response: access_token not found or is not a string',
        );
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await api.post(
        ApiEndpoints.register,
        queryParameters: {
          'full_name': username,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );
      if (response[StorageKeys.accessToken] != null &&
          response[StorageKeys.refershToken] != null) {
        final access = response[StorageKeys.accessToken];
        final refersh = response[StorageKeys.accessToken];

        await storage.save(StorageKeys.refershToken, refersh);
        await storage.save(StorageKeys.accessToken, access);
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
