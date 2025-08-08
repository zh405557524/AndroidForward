import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

import '../../core/api_client.dart';

class ImageUploadService {
  static Future<String> uploadImage(File file) async {
    final fileName = basename(file.path);
    FormData formData =
        FormData.fromMap({'file': await MultipartFile.fromFile(file.path, filename: fileName)});

    final response = await Dio().post(
      '${ApiClient.baseUrl}/upload?key=YOUR_API_KEY', // 例：使用 imgbb 上传
      data: formData,
    );

    if (response.statusCode == 200) {
      return response.data['data']['url'];
    } else {
      throw Exception('Image upload failed: ${response.statusMessage}');
    }
  }
}
