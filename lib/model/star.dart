import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'star.g.dart';

@JsonSerializable()
class Star {
  String? page;
  String? limit;
  int? total;
  List<StarInfo>? data;

  Star({this.page, this.limit, this.total, this.data});

  factory Star.fromJson(Map<String, dynamic> json) {
    return _$StarFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StarToJson(this);
  }
}

@JsonSerializable()
class StarInfo {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'update_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'recipe_id')
  int? recipeId;
  @JsonKey(name: 'is_collection')
  int? isCollection;
  @JsonKey(name: 'is_delete')
  int? isDelete;
  UserModel? userInfo;
  Cook? recipeInfo;

  StarInfo(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.id,
      this.userId,
      this.recipeId,
      this.isCollection,
      this.isDelete,
      this.userInfo,
      this.recipeInfo});

  factory StarInfo.fromJson(Map<String, dynamic> json) {
    return _$StarInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StarInfoToJson(this);
  }
}
