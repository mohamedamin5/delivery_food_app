import 'package:flutter_application_2/core/services/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements StorageService {
  final FlutterSecureStorage _storage;
  SecureStorageImpl(this._storage);

  @override
  Future<void> delete(String key) {
    _storage.delete(key: key);
    throw UnimplementedError();
  }

  @override
  Future<String?> read(String key) {
    _storage.read(key: key);
    throw UnimplementedError();
  }

  @override
  Future<void> save(String key, String value) {
    _storage.write(key: key, value: value);
    throw UnimplementedError();
  }
}
