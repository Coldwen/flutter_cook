import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/util/upload_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<String?> pickerMedia(
  BuildContext context, {
  Cook? cook,
  FileType type = FileType.media,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: type,
  );
  if (result != null) {
    final file = result.files.single;
    if (file.size > 5 * 1024 * 1024) {
      Fluttertoast.showToast(msg: '上传文件请小于5M');
      return null;
    }
    String path = file.path!;
    String name = file.name;
    final type = file.extension;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    Response response = await UploadUtil.uploadFile(path, name);
    String? source = response.data['data']?['source'];
    String? compress = response.data['data']?['compress'];
    Navigator.pop(context);
    if (source == null) return null;
    if (cook == null) return source;
    if (type == 'mp4') {
      cook.recipeVideo = source;
      cook.recipeImage = compress;
    } else {
      logger.v(cook.recipeImage);
      cook.recipeImage = source;
      cook.recipeVideo = null;
    }
    return source;
  }
}
