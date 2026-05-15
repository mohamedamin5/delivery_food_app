import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_2/core/data/data_source/base_storage_data_sourc.dart';

class FirebaseStorageImpl implements BaseStorageDataSource {
  final FirebaseStorage _storage;
  FirebaseStorageImpl(this._storage);
  @override
  Future<String> uploadFile({
    required String filePath,
    required File file,
  }) async {
    return " ";
  }
}
