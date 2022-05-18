import 'package:flutter_cook/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentInfo {
  int? page;
  int? limit;
  int? total;
  List<Comment>? data;

  CommentInfo({
    this.page,
    this.limit,
    this.total,
    this.data,
  });

  factory CommentInfo.fromJson(Map<String, dynamic> json) {
    return _$CommentInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CommentInfoToJson(this);
  }
}

@JsonSerializable()
class Comment {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'update_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'is_collection')
  int? isCollection;
  @JsonKey(name: 'is_delete')
  int? isDelete;
  int? id;
  @JsonKey(name: 'recipe_id')
  int? recipeId;
  String? des;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'editer_id')
  int? editerId;
  UserModel? userInfo;

  Comment({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isCollection,
    this.isDelete,
    this.id,
    this.recipeId,
    this.des,
    this.userId,
    this.editerId,
    this.userInfo,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CommentToJson(this);
  }
}
