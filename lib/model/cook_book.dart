import 'package:flutter_cook/model/comment.dart';
import 'package:flutter_cook/model/star.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cook_book.g.dart';

@JsonSerializable()
class CookBook {
  String? status;
  int? code;
  CookInfo? data;
  String? message;

  CookBook({this.status, this.code, this.data, this.message});

  factory CookBook.fromJson(Map<String, dynamic> json) {
    return _$CookBookFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CookBookToJson(this);
  }
}

@JsonSerializable()
class CookInfo {
  String? page;
  String? limit;
  int? total;
  List<Cook>? data;

  CookInfo({this.page, this.limit, this.total, this.data});

  factory CookInfo.fromJson(Map<String, dynamic> json) {
    return _$CookInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CookInfoToJson(this);
  }
}

@JsonSerializable()
class CookDetail {
  Cook? info;
  @JsonKey(name: 'is_follow')
  int? isFollow;

  CookDetail({this.info, this.isFollow});

  factory CookDetail.fromJson(Map<String, dynamic> json) {
    return _$CookDetailFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CookDetailToJson(this);
  }
}

@JsonSerializable()
class Cook {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'recipe_image')
  String? recipeImage;
  @JsonKey(name: 'recipe_video')
  String? recipeVideo;
  String? name;
  String? story;
  String? useds;
  String? steps;
  String? tips;
  String? duration;
  String? difficulty;
  String? sort;
  @JsonKey(name: 'is_delete')
  int? isDelete;
  UserModel? userInfo;
  List<StarInfo>? collectionRecipeInfo;
  List<Comment>? commentRecipeInfo;

  Cook({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.id,
    this.userId,
    this.recipeImage,
    this.recipeVideo,
    this.name,
    this.story,
    this.useds,
    this.steps,
    this.tips,
    this.duration,
    this.difficulty,
    this.sort,
    this.isDelete,
    this.userInfo,
    this.collectionRecipeInfo,
    this.commentRecipeInfo,
  });

  factory Cook.fromJson(Map<String, dynamic> json) {
    return _$CookFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CookToJson(this);
  }
}
