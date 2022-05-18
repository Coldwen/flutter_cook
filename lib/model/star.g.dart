// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Star _$StarFromJson(Map<String, dynamic> json) => Star(
      page: json['page'] as String?,
      limit: json['limit'] as String?,
      total: json['total'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StarInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StarToJson(Star instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'data': instance.data,
    };

StarInfo _$StarInfoFromJson(Map<String, dynamic> json) => StarInfo(
      createdAt: json['created_at'] as String?,
      updatedAt: json['update_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      recipeId: json['recipe_id'] as int?,
      isCollection: json['is_collection'] as int?,
      isDelete: json['is_delete'] as int?,
      userInfo: json['userInfo'] == null
          ? null
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      recipeInfo: json['recipeInfo'] == null
          ? null
          : Cook.fromJson(json['recipeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StarInfoToJson(StarInfo instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'update_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'recipe_id': instance.recipeId,
      'is_collection': instance.isCollection,
      'is_delete': instance.isDelete,
      'userInfo': instance.userInfo,
      'recipeInfo': instance.recipeInfo,
    };
