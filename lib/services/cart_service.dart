import 'package:dio/dio.dart';
import 'package:flutter_cook/model/cart.dart';
import 'package:flutter_cook/model/goods.dart';
import 'package:flutter_cook/net/dio_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartService {
  static Future addGoods(GoodsModel goodsModel) async {
    Response response = await DioManager.instance.post('/api/cart', data: {
      'goods_id': goodsModel.id,
      'num': '1',
    });
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: '加入成功');
    }
  }

  static Future deleteGoods(int id) async {
    await DioManager.instance.delete('/api/cart/$id');
  }

  static Future<List<Cart>?> fetchGoodsList() async {
    Response response = await DioManager.instance.get('/api/cart/list');
    if (response.statusCode == 200) {
      CartModel cartModel = CartModel.fromJson(response.data['data']);
      return cartModel.data;
    }
    return [];
  }
}
