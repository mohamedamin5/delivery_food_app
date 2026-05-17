import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class PathGenerator {
  static String _getImageExtension({required String filePath}) {
    return p.extension(filePath);
  }

  static Future<String> getTempImagePath({required String filePath}) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String uniqueName = const Uuid().v4();
    final String extension = _getImageExtension(filePath: filePath);
    return p.join(tempDir.path, '$uniqueName$extension');
  }

  static String generateUniqueFilePath({
    required String folderName,
    required String userId,
    required String filePath,
  }) {
    final String uniqueName = const Uuid().v4();
    final String date = DateTime.now().millisecondsSinceEpoch.toString();
    final String extension = _getImageExtension(filePath: filePath);
    final String fileName = '$uniqueName$date$extension';
    return "$folderName/$userId/$fileName";
  }
}
