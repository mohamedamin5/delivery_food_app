import 'package:flutter_application_2/core/data/data_source/secure_storage_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageDataSourceImpl implements SecureStorageDataSource {
  final FlutterSecureStorage _storage;
  SecureStorageDataSourceImpl(this._storage);

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
