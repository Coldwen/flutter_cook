import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
class GoodsInfo {
  String? page;
  String? limit;
  int? total;
  List<GoodsModel>? data;

  GoodsInfo(this.page, this.limit, this.total, this.data);

  factory GoodsInfo.fromJson(Map<String, dynamic> json) {
    return _$GoodsInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoodsInfoToJson(this);
  }
}

@JsonSerializable()
class GoodsModel {
  int? id;
  String? name;
  String? price;
  String? photo;

  GoodsModel({
    this.id,
    this.name,
    this.price,
    this.photo,
  });

  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    return _$GoodsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoodsModelToJson(this);
  }
}
