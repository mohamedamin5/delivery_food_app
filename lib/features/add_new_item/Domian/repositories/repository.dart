import 'dart:io';
import 'package:flutter_application_2/core/data/data_source/base_storage_data_sourc.dart';
import 'package:flutter_application_2/core/utils/flutter_image_compress_helper.dart';
import 'package:flutter_application_2/features/add_new_item/data/datasource/add_item_remote.dart';
import 'package:flutter_application_2/features/add_new_item/data/model/add_item_response_model.dart';

class AddItemRepository {
  final BaseStorageDataSource _storageDataSource;

  final ImageCompressorService _imageCompressorService;
  final AddItemRemote _addItemRemote;
  AddItemRepository(
    this._storageDataSource,

    this._imageCompressorService,
    this._addItemRemote,
  );

  Future<File> getProcessedImage(File file) async {
    try {
      final compressedFile = await _imageCompressorService
          .compressImage(file)
          .timeout(const Duration(seconds: 10));

      return compressedFile ?? file;
    } catch (_) {
      return file;
    }
  }

  Future<String> executeUpload(String filepath, File file) async {
    return await _storageDataSource
        .uploadFile(filePath: filepath, file: file)
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => throw (
            "Connection timed out! Network is very weak or server is not responding",
          ),
        );
  }

  Future<void> addItem(
    String name,
    String description,
    double price,
    int categoryId,
    String imageUrl,
  ) async {
    try {
      await _addItemRemote.addItem(
        name,
        description,
        price,
        categoryId,
        imageUrl,
      );
    } catch (e) {
      throw ("Failed to add item to database: $e");
    }
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
