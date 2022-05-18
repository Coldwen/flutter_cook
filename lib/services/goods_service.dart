import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cook/model/goods.dart';
import 'package:flutter_cook/net/dio_manager.dart';

// 商品列表
class GoodsService {
  static Future fetchGoods({int page = 1, int size = 10, String? key}) async {
    Response response =
        await DioManager.instance.get('/api/goods/list', params: {
      'page': page,
      'limit': size,
      'key': key,
    });
    final data = response.data;
    if (data != null && response.statusCode == 200) {
      GoodsInfo goodsInfo = GoodsInfo.fromJson(data['data']);
      return goodsInfo.data ?? [];
    }
    return <GoodsModel>[];
  }
}
