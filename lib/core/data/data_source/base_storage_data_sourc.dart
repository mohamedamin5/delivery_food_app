import 'dart:io';

abstract class BaseStorageDataSource {
  Future<String> uploadFile({required String filePath, required File file});
}
