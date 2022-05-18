// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      createdAt: json['created_at'] as String?,
      updatedAt: json['update_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      goodsId: json['goods_id'] as int?,
      orderId: json['order_id'] as int?,
      num: json['num'] as int?,
      isDelete: json['is_delete'] as int?,
      goodsInfo: json['goodsInfo'] == null
          ? null
          : GoodsModel.fromJson(json['goodsInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'update_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'goods_id': instance.goodsId,
      'order_id': instance.orderId,
      'num': instance.num,
      'is_delete': instance.isDelete,
      'goodsInfo': instance.goodsInfo,
    };
