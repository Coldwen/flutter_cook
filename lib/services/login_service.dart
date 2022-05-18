import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/net/dio_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginService {
  // 注册
  static Future<bool> addUser(UserModel userModel) async {
    Map<String, dynamic> params = {
      'mail': userModel.mail,
      'password': userModel.password,
    };
    if (userModel.nikeName != null) params['nike_name'] = userModel.nikeName;
    if (userModel.photo != null) params['photo'] = userModel.photo;
    if (userModel.sign != null) params['sign'] = userModel.sign;
    if (userModel.phone != null) params['phone'] = userModel.phone;
    if (userModel.address != null) params['address'] = userModel.address;
    if (userModel.address != null) params['photo'] = userModel.photo;

    Response response =
        await DioManager.instance.post('/api/user', data: params);
    return response.statusCode == 200;
  }

  static Future updateUser(UserModel userModel) async {
    Map<String, dynamic> params = {};
    if (userModel.nikeName != null) params['nike_name'] = userModel.nikeName;
    if (userModel.photo != null) params['photo'] = userModel.photo;
    if (userModel.sign != null) params['sign'] = userModel.sign;
    if (userModel.phone != null) params['phone'] = userModel.phone;
    if (userModel.address != null) params['address'] = userModel.address;
    Response response =
        await DioManager.instance.put('/api/user', data: params);
    if (response.statusCode == 200) Fluttertoast.showToast(msg: '更新成功');
  }

  // 登录
  static Future<bool> login(
      String mail, String pwd, BuildContext context) async {
    Response response = await DioManager.instance.post('/api/login', data: {
      'mail': mail,
      'password': pwd,
    });
    final data = response.data;
    if (response.statusCode == 200 && data != null) {
      if (data['data']['code'] == null) {
        String token = data['data']['token'];
        UserModel userModel = UserModel.fromJson(data['data']['info']);
        int follows = data['data']?['follows'] ?? 0;
        int fans = data['data']?['fans'] ?? 0;
        userModel.follows = follows;
        userModel.fans = fans;
        userModel.mail = mail;
        userModel.password = pwd;
        Application.userModel = userModel;
        DioManager.instance.addCookie(token);
        Application.saveToken(token);
        Application.saveUser(userModel);
        Fluttertoast.showToast(msg: '登陆成功');
        return true;
      } else {
        Fluttertoast.showToast(msg: '账号或者密码错误');
        return false;
      }
    }
    return false;
  }
}
