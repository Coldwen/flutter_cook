import 'package:dio/dio.dart';
import 'package:flutter_cook/model/star.dart';
import 'package:flutter_cook/net/dio_manager.dart';

class StarService {
  /// 收藏、取消
  static Future<bool> star(int recipeId) async {
    Response response =
        await DioManager.instance.post('/api/collectionRecipe', data: {
      'recipe_id': recipeId,
    });
    return response.statusCode == 200;
  }

  /// 收藏列表
  static Future<Star?> fetchStar([int page = 1, int pageSize = 10]) async {
    Response response =
        await DioManager.instance.get('/api/collectionRecipe/list', params: {
      'page': page,
      'limit': pageSize,
    });
    if (response.data['data'] == null) return null;
    Star info = Star.fromJson(response.data['data']);
    return info;
  }
}
