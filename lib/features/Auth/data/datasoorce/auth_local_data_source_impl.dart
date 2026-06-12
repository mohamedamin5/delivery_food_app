import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_source.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageDataSource storage;

  AuthLocalDataSourceImpl(this.storage);
  @override
  Future<void> clearAuthData() async {
    await storage.delete(StorageKeys.accessToken);
    await storage.delete(StorageKeys.refreshToken);
    await storage.delete(StorageKeys.role);
    await storage.delete(StorageKeys.userId);
  }

  @override
  Future<String?> getAuthData(String key) async {
    return await storage.read(key);
  }

  @override
  Future<void> saveAuthData(
    String accessToken,
    String refreshToken,
    String role,
    String userId,
  ) async {
    await storage.save(StorageKeys.accessToken, accessToken);
    await storage.save(StorageKeys.refreshToken, refreshToken);
    await storage.save(StorageKeys.role, role);
    await storage.save(StorageKeys.userId, userId);
  }

  @override
  Future<void> updateAccessToken(String newAccessToken) async {
    await storage.save(StorageKeys.accessToken, newAccessToken);
  }
}
