import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? page;
  int? limit;
  int? total;
  List<UserInfo>? data;

  User({this.page, this.limit, this.total, this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class UserInfo {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'update_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  UserModel? userInfo;
  UserModel? fansInfo;

  UserInfo(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userInfo,
      this.fansInfo});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(this);
  }
}

@JsonSerializable()
class UserModel {
  // unique key
  int? id;
  String? mail;
  String? password;
  @JsonKey(name: 'nike_name')
  String? nikeName;
  String? photo;
  String? sign;
  String? phone;
  String? address;
  int? follows;
  int? fans;

  UserModel({
    this.id,
    this.mail,
    this.password,
    this.nikeName,
    this.photo,
    this.sign,
    this.phone,
    this.address,
    this.follows,
    this.fans,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
