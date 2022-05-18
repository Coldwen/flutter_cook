// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) => CommentInfo(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentInfoToJson(CommentInfo instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'data': instance.data,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      createdAt: json['created_at'] as String?,
      updatedAt: json['update_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      isCollection: json['is_collection'] as int?,
      isDelete: json['is_delete'] as int?,
      id: json['id'] as int?,
      recipeId: json['recipe_id'] as int?,
      des: json['des'] as String?,
      userId: json['user_id'] as int?,
      editerId: json['editer_id'] as int?,
      userInfo: json['userInfo'] == null
          ? null
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'update_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'is_collection': instance.isCollection,
      'is_delete': instance.isDelete,
      'id': instance.id,
      'recipe_id': instance.recipeId,
      'des': instance.des,
      'user_id': instance.userId,
      'editer_id': instance.editerId,
      'userInfo': instance.userInfo,
    };
