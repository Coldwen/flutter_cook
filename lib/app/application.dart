import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/net/dio_manager.dart';
import 'package:flutter_cook/util/permission_util.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

Logger logger = Logger();

class Application {
  static late FluroRouter _router;

  static late UserModel userModel;

  static const String _TokenKey = 'TOKEN';
  static const String _UserKey = 'User';

  static FluroRouter get router => _router;

  static void initRouter(FluroRouter router) {
    _router = router;
  }

  static bool isInit = false;

  static void init() async {
    if (!isInit) {
      isInit = true;
      await PermissionUtil.requestPermission(Permission.storage);
      DioManager.instance.init('http://192.168.0.116:3002'); // 服务端接口地址
      String? token = await getToken();
      DioManager.instance.addCookie(token);
      UserModel user = await getUser();
      userModel = user;
    }
  }

  static Future saveToken(String token) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(_TokenKey, token);
  }

  static Future clear() async {
    final sp = await SharedPreferences.getInstance();
    sp.remove(_TokenKey);
    sp.remove(_UserKey);
  }

  static Future<String?> getToken() async {
    final sp = await SharedPreferences.getInstance();
    String? token = sp.getString(_TokenKey);
    return token;
  }

  static Future saveUser(UserModel userModel) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(_UserKey, jsonEncode(userModel));
  }

  static Future<UserModel> getUser() async {
    final sp = await SharedPreferences.getInstance();
    String? userStr = sp.getString(_UserKey);
    if (userStr == null) return UserModel();
    UserModel userModel = UserModel.fromJson(jsonDecode(userStr));
    return userModel;
  }
}
