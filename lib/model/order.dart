import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderInfo {
  String? page;
  String? limit;
  int? total;
  List<OrderModel>? data;

  OrderInfo({this.page, this.limit, this.total, this.data});

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    return _$OrderInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderInfoToJson(this);
  }
}

@JsonSerializable()
class OrderModel {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'is_delete')
  int? isDelete;
  List<GoodsListInfo>? goodsListInfo;

  OrderModel(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.id,
      this.userId,
      this.isDelete,
      this.goodsListInfo});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}

@JsonSerializable()
class GoodsListInfo {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  int? num;
  @JsonKey(name: 'is_delete')
  int? isDelete;
  GoodsInfo? goodsInfo;

  GoodsListInfo(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.id,
      this.userId,
      this.num,
      this.isDelete,
      this.goodsInfo});

  factory GoodsListInfo.fromJson(Map<String, dynamic> json) {
    return _$GoodsListInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoodsListInfoToJson(this);
  }
}

@JsonSerializable()
class GoodsInfo {
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  String? name;
  String? price;
  String? photo;
  @JsonKey(name: 'is_delete')
  int? isDelete;

  GoodsInfo(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.id,
      this.userId,
      this.name,
      this.price,
      this.photo,
      this.isDelete});

  factory GoodsInfo.fromJson(Map<String, dynamic> json) {
    return _$GoodsInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoodsInfoToJson(this);
  }
}
