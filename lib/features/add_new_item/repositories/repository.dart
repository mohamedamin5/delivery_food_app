import 'dart:io';

import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/data/data_source/base_storage_data_sourc.dart';
import 'package:flutter_application_2/core/utils/file_path_utils.dart';
import 'package:flutter_application_2/core/utils/flutter_image_compress_helper.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';

class AddItemRepository {
  final BaseStorageDataSource _storageDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final ImageCompressorService _imageCompressorService;
  AddItemRepository(
    this._storageDataSource,
    this._authLocalDataSource,
    this._imageCompressorService,
  );

  Future<String> uploadFile({required File file}) async {
    final userId = await _authLocalDataSource.getAuthData(StorageKeys.userId);
    final compressedFile = await _imageCompressorService.compressImage(file);
    final filepath = PathGenerator.generateUniqueFilePath(
      folderName: "items",
      userId: userId!,
      filePath: compressedFile!.path,
    );

    return await _storageDataSource.uploadFile(
      filePath: filepath,
      file: compressedFile,
    );
  }
}
