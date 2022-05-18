import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/cart.dart';
import 'package:flutter_cook/model/order.dart';
import 'package:flutter_cook/net/dio_manager.dart';

class OrderService {
  static Future addOrder(List<Cart> carts) async {
    List<int> ids = [];
    for (var element in carts) {
      ids.add(element.id!);
    }
    String idsStr = ids.toString();
    idsStr = idsStr.substring(1, idsStr.length - 1);
    logger.v(idsStr);
    await DioManager.instance.post('/api/order', data: {
      'ids': idsStr.replaceAll(', ', ','),
    });
  }

  static Future<bool> deleteOrder(int id) async {
    Response response = await DioManager.instance.put('/api/order/$id');
    return response.statusCode == 200;
  }

  static Future<List<OrderModel>> fetchOrders(
      [int page = 1, int limit = 10]) async {
    Response response =
        await DioManager.instance.get('/api/order/list', params: {
      'page': page,
      'limit': limit,
    });
    if (response.statusCode == 200) {
      OrderInfo orderInfo = OrderInfo.fromJson(response.data['data']);
      logger.v(response.data['data']);
      return orderInfo.data ?? [];
    }
    return [];
  }
}
