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
    try {
      final ref = _storage.ref().child(filePath);
      final uploadTask = ref.putFile(file);

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  }
}
