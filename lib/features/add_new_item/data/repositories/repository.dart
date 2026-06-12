import 'dart:io';

import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/data/data_source/base_storage_data_sourc.dart';
import 'package:flutter_application_2/core/utils/file_path_utils.dart';
import 'package:flutter_application_2/core/utils/flutter_image_compress_helper.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';
import 'package:flutter_application_2/features/add_new_item/data/datasource/add_item_remote.dart';
import 'package:flutter_application_2/features/add_new_item/data/model/add_item_response_model.dart';

class AddItemRepository {
  final BaseStorageDataSource _storageDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final ImageCompressorService _imageCompressorService;
  final AddItemRemote _addItemRemote;
  AddItemRepository(
    this._storageDataSource,
    this._authLocalDataSource,
    this._imageCompressorService,
    this._addItemRemote,
  );
  Future<String> uploadUserItemImage(File? file) async {
    try {
      _validateInputFile(file);

      final userId = await _getAuthenticatedUserId();
      final targetFile = await _getProcessedImage(file!);

      final filepath = PathGenerator.generateUniqueFilePath(
        folderName: "items",
        userId: userId,
        filePath: targetFile.path,
      );

      return await _executeUpload(filepath, targetFile);
    } catch (e) {
      rethrow;
    }
  }

  void _validateInputFile(File? file) {
    if (file == null) {
      throw ("The provided file is null");
    }
  }

  Future<String> _getAuthenticatedUserId() async {
    final userId = await _authLocalDataSource
        .getAuthData(StorageKeys.userId)
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw ("Failed to fetch user data (Timeout)",),
        );

    if (userId == null) {
      throw ("User is not logged in");
    }
    return userId;
  }

  Future<File> _getProcessedImage(File file) async {
    try {
      final compressedFile = await _imageCompressorService
          .compressImage(file)
          .timeout(const Duration(seconds: 10));

      return compressedFile ?? file;
    } catch (_) {
      // في حال حدوث Timeout أو أي خطأ أثناء الضغط، نمرر الملف الأصلي كخطة بديلة (Fallback)
      return file;
    }
  }

  Future<String> _executeUpload(String filepath, File file) async {
    return await _storageDataSource
        .uploadFile(filePath: filepath, file: file)
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => throw (
            "Connection timed out! Network is very weak or server is not responding",
          ),
        );
  }

  Future<List<AddItemResponseModel>> getALlCategories() async {
    try {
      final categories = await _addItemRemote.getallCategories();
      return categories;
    } catch (e) {
      throw ("Failed to fetch categories: $e");
    }
  }
}
