import 'package:dio/dio.dart';
import 'package:flutter_cook/model/comment.dart';
import 'package:flutter_cook/net/dio_manager.dart';

class CommentService {
  /// 添加评论
  static Future addComment(int recipeId, String des) async {
    Response response =
        await DioManager.instance.post('/api/commentRecipe', data: {
      'recipe_id': recipeId,
      'des': des,
    });
    return response.statusCode == 200;
  }

  /// 收到评论
  static Future<CommentInfo?> receiveComment() async {
    Response response =
        await DioManager.instance.get('/api/commentRecipe/list');
    if (response.data['data'] == null) return null;
    CommentInfo info = CommentInfo.fromJson(response.data['data']);
    return info;
  }
}
