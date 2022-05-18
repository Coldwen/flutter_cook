// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsInfo _$GoodsInfoFromJson(Map<String, dynamic> json) => GoodsInfo(
      json['page'] as String?,
      json['limit'] as String?,
      json['total'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => GoodsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoodsInfoToJson(GoodsInfo instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'data': instance.data,
    };

GoodsModel _$GoodsModelFromJson(Map<String, dynamic> json) => GoodsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$GoodsModelToJson(GoodsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
    };
