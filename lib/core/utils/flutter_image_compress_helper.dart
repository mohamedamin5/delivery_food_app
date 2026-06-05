import 'dart:io';

import 'package:flutter_application_2/core/utils/file_path_utils.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressorService {
  Future<File?> compressImage(File? file) async {
    try {
      final String targetPath = await PathGenerator.getTempImagePath(
        filePath: file!.path,
      );

      final XFile? result = await FlutterImageCompress.compressAndGetFile(
        file!.path,
        targetPath,
        quality: 80,
      );
      return File(result!.path);
    } catch (e) {
      print("Error compressing image: $e");
      return null;
    }
  }
}
