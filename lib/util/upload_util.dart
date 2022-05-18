import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/net/dio_manager.dart';
import 'package:path/path.dart' as path;

class UploadUtil {
  static Future<Response> uploadFile(
    String filePath,
    String fileName,
  ) async {
    Map<String, dynamic> data = {};

    data['file'] = await MultipartFile.fromFile(
      filePath,
      filename: fileName,
    );
    FormData formData = FormData.fromMap(data); //form data上传文件
    Response response = await DioManager.instance.postForm('/api/file',
        params: formData, onSendProgress: (count, total) {
      logger.v(count / total);
    });
    return response;
  }
}
