import 'package:flutter_cook/model/goods.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class CartModel {
  List<Cart>? data;
  int? page;
  int? limit;
  int? total;

  CartModel({this.data, this.page, this.limit, this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return _$CartModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartModelToJson(this);
  }
}

@JsonSerializable()
class Cart {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'update_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'goods_id')
  int? goodsId;
  @JsonKey(name: 'order_id')
  int? orderId;
  int? num;
  @JsonKey(name: 'is_delete')
  int? isDelete;
  @JsonKey(name: 'goodsInfo')
  GoodsModel? goodsInfo;

  Cart({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.id,
    this.userId,
    this.goodsId,
    this.orderId,
    this.num,
    this.isDelete,
    this.goodsInfo,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }
}
