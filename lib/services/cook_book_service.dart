import 'package:dio/dio.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/net/dio_manager.dart';

class CookBookService {
  static Future<bool> addCookBook(Cook cook) async {
    Map<String, dynamic> data = {};
    if (cook.recipeImage != null) data['recipe_image'] = cook.recipeImage;
    if (cook.recipeVideo != null) data['recipe_video'] = cook.recipeVideo;
    if (cook.name != null) data['name'] = cook.name;
    if (cook.story != null) data['story'] = cook.story;
    if (cook.useds != null) data['useds'] = cook.useds;
    if (cook.steps != null) data['steps'] = cook.steps;
    if (cook.tips != null) data['tips'] = cook.tips;
    if (cook.duration != null) data['duration'] = cook.duration;
    if (cook.difficulty != null) data['difficulty'] = cook.difficulty;
    if (cook.sort != null) data['sort'] = cook.sort;

    logger.v(data);
    Response response =
        await DioManager.instance.post('/api/recipe', data: data);
    return response.data == 200;
  }

  static Future<CookInfo?> fetchSelfCook(
      [int page = 1, int pageSize = 10]) async {
    Response response =
        await DioManager.instance.get('/api/recipe/user/list', params: {
      'page': page,
      'limit': pageSize,
    });
    final data = response.data['data'];
    if (data == null) return null;
    CookInfo cookInfo = CookInfo.fromJson(data);
    return cookInfo;
  }

  static Future<CookInfo?> fetchCook({
    int page = 1,
    int pageSize = 10,
    String? key,
  }) async {
    Response response =
        await DioManager.instance.get('/api/recipe/list', params: {
      'page': page,
      'limit': pageSize,
      'key': key,
    });
    final data = response.data['data'];
    if (data == null) return null;
    CookInfo cookInfo = CookInfo.fromJson(data);
    return cookInfo;
  }

  static Future<CookDetail?> fetchCookDetail(int id) async {
    Response response = await DioManager.instance.get('/api/recipe/$id');
    final data = response.data['data'];
    if (data == null) return null;
    CookDetail? cookInfo = CookDetail.fromJson(data);
    return cookInfo;
  }

  static Future<bool> deleteCookDetail(int id) async {
    Response response = await DioManager.instance.delete('/api/recipe/$id');
    return response.statusCode == 200;
  }
}
