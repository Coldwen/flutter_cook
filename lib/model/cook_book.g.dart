// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cook_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CookBook _$CookBookFromJson(Map<String, dynamic> json) => CookBook(
      status: json['status'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : CookInfo.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CookBookToJson(CookBook instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

CookInfo _$CookInfoFromJson(Map<String, dynamic> json) => CookInfo(
      page: json['page'] as String?,
      limit: json['limit'] as String?,
      total: json['total'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Cook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CookInfoToJson(CookInfo instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'data': instance.data,
    };

CookDetail _$CookDetailFromJson(Map<String, dynamic> json) => CookDetail(
      info: json['info'] == null
          ? null
          : Cook.fromJson(json['info'] as Map<String, dynamic>),
      isFollow: json['is_follow'] as int?,
    );

Map<String, dynamic> _$CookDetailToJson(CookDetail instance) =>
    <String, dynamic>{
      'info': instance.info,
      'is_follow': instance.isFollow,
    };

Cook _$CookFromJson(Map<String, dynamic> json) => Cook(
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      recipeImage: json['recipe_image'] as String?,
      recipeVideo: json['recipe_video'] as String?,
      name: json['name'] as String?,
      story: json['story'] as String?,
      useds: json['useds'] as String?,
      steps: json['steps'] as String?,
      tips: json['tips'] as String?,
      duration: json['duration'] as String?,
      difficulty: json['difficulty'] as String?,
      sort: json['sort'] as String?,
      isDelete: json['is_delete'] as int?,
      userInfo: json['userInfo'] == null
          ? null
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      collectionRecipeInfo: (json['collectionRecipeInfo'] as List<dynamic>?)
          ?.map((e) => StarInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentRecipeInfo: (json['commentRecipeInfo'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CookToJson(Cook instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'user_id': instance.userId,
      'recipe_image': instance.recipeImage,
      'recipe_video': instance.recipeVideo,
      'name': instance.name,
      'story': instance.story,
      'useds': instance.useds,
      'steps': instance.steps,
      'tips': instance.tips,
      'duration': instance.duration,
      'difficulty': instance.difficulty,
      'sort': instance.sort,
      'is_delete': instance.isDelete,
      'userInfo': instance.userInfo,
      'collectionRecipeInfo': instance.collectionRecipeInfo,
      'commentRecipeInfo': instance.commentRecipeInfo,
    };
