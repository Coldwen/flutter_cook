// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'data': instance.data,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      createdAt: json['created_at'] as String?,
      updatedAt: json['update_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      userInfo: json['userInfo'] == null
          ? null
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      fansInfo: json['fansInfo'] == null
          ? null
          : UserModel.fromJson(json['fansInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'update_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'userInfo': instance.userInfo,
      'fansInfo': instance.fansInfo,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      mail: json['mail'] as String?,
      password: json['password'] as String?,
      nikeName: json['nike_name'] as String?,
      photo: json['photo'] as String?,
      sign: json['sign'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      follows: json['follows'] as int?,
      fans: json['fans'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'mail': instance.mail,
      'password': instance.password,
      'nike_name': instance.nikeName,
      'photo': instance.photo,
      'sign': instance.sign,
      'phone': instance.phone,
      'address': instance.address,
      'follows': instance.follows,
      'fans': instance.fans,
    };
