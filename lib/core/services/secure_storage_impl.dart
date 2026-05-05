import 'package:flutter_application_2/core/services/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements StorageService {
  final FlutterSecureStorage _storage;
  SecureStorageImpl(this._storage);

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<String?> read(String key) async {
    final value = await _storage.read(key: key);
    return value;
  }

  @override
  Future<void> save(String key, String value) async {
    await _storage.write(key: key, value: value);
  }
}
