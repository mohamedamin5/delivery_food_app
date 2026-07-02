import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/consts/storage_keys.dart';
import 'package:flutter_application_2/core/errors/failures.dart';
import 'package:flutter_application_2/core/utils/file_path_utils.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';
import 'package:flutter_application_2/features/add_new_item/Domian/repositories/repository.dart';

class AddItemUseCase {
  final AuthLocalDataSource _authLocalDataSource;
  final AddItemRepository _addItemRepository;

  AddItemUseCase(this._authLocalDataSource, this._addItemRepository);
  Future<Either<Failure, String>> saveItemToStorage(File? file) async {
    final userId = await _authLocalDataSource.getAuthData(StorageKeys.userId);
    if (userId == null) {
      return Left(LocalFailure("User ID not found in local storage"));
    }
    if (file == null) {
      return Left(LocalFailure("No file provided for upload"));
    }
    try {
      final trtargetFile = await _addItemRepository.getProcessedImage(file);

      final filepath = PathGenerator.generateUniqueFilePath(
        folderName: "items",
        userId: userId,
        filePath: trtargetFile.path,
      );

      final imageUrl = await _addItemRepository.executeUpload(
        filepath,
        trtargetFile,
      );
      return Right(imageUrl);
    } catch (e) {
      return Left(LocalFailure("Failed to upload item image: $e"));
    }
  }

  Future<Either<Failure, void>> addItemToDatabase(
    String name,
    String description,
    double price,
    int categoryId,
    File? file,
  ) async {
    try {
      final response = await saveItemToStorage(file);

      response.fold((failure) => ServerFailure(failure.message), (
        imageUrl,
      ) async {
        await _addItemRepository.addItem(
          name,
          description,
          price,
          categoryId,
          imageUrl,
        );
      });

      return Right(null);
    } catch (e) {
      return Left(LocalFailure("Failed to add item to database: $e"));
    }
  }
}
