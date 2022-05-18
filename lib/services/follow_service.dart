import 'package:dio/dio.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/net/dio_manager.dart';

class FollowService {
  /// 关注菜谱
  /// 1：关注，0：取消关注
  static Future<bool> followCookBook(int recipeId, int isCollection) async {
    Response response =
        await DioManager.instance.post('/api/FollowRecipe', data: {
      'recipe_id': recipeId,
      'is_collection': isCollection,
    });
    return response.statusCode == 200;
  }

  /// 我关注的菜谱
  static Future<CookInfo?> fetchCookBook(
      [int page = 1, int pageSize = 10]) async {
    Response response =
        await DioManager.instance.get('/api/followRecipe/list', params: {
      'page': page,
      'limit': pageSize,
    });
    final data = response.data['data'];
    if (data == null) return null;
    CookInfo cookInfo = CookInfo.fromJson(data);
    return cookInfo;
  }

  /// 我关注的用户
  static Future<User?> fetchFollow() async {
    Response response = await DioManager.instance.get('/api/followUser');
    final data = response.data['data'];
    if (data == null) return null;
    User user = User.fromJson(data);
    return user;
  }

  /// 关注用户
  /// isCollection 1:关注，0：取消关注
  static Future<bool> followUser(int followId, [int isCollection = 1]) async {
    Response response =
        await DioManager.instance.post('/api/followUser', data: {
      'follow_id': followId,
      'is_collection': isCollection,
    });
    return response.statusCode == 200;
  }

  /// 粉丝
  static Future<User?> fetchFans() async {
    Response response = await DioManager.instance.get('/api/fans');
    final data = response.data['data'];
    if (data == null) return null;
    User user = User.fromJson(data);
    return user;
  }
}
