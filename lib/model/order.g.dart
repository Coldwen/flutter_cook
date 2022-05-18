// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) => OrderInfo(
      page: json['page'] as String?,
      limit: json['limit'] as String?,
      total: json['total'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'data': instance.data,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      isDelete: json['is_delete'] as int?,
      goodsListInfo: (json['goodsListInfo'] as List<dynamic>?)
          ?.map((e) => GoodsListInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'is_delete': instance.isDelete,
      'goodsListInfo': instance.goodsListInfo,
    };

GoodsListInfo _$GoodsListInfoFromJson(Map<String, dynamic> json) =>
    GoodsListInfo(
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      num: json['num'] as int?,
      isDelete: json['is_delete'] as int?,
      goodsInfo: json['goodsInfo'] == null
          ? null
          : GoodsInfo.fromJson(json['goodsInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoodsListInfoToJson(GoodsListInfo instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'num': instance.num,
      'is_delete': instance.isDelete,
      'goodsInfo': instance.goodsInfo,
    };

GoodsInfo _$GoodsInfoFromJson(Map<String, dynamic> json) => GoodsInfo(
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      photo: json['photo'] as String?,
      isDelete: json['is_delete'] as int?,
    );

Map<String, dynamic> _$GoodsInfoToJson(GoodsInfo instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
      'is_delete': instance.isDelete,
    };
