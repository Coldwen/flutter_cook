import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Useds {
  ///食材
  String? shicai;

  ///用量
  String? count;

  Useds({this.shicai, this.count});

  factory Useds.fromJson(Map<String, dynamic> json) {
    return _$UsedsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UsedsToJson(this);
  }
}

@JsonSerializable()
class Steps {
  ///步骤图
  String? image;

  ///步骤说明
  String? intro;

  Steps({this.image, this.intro});

  factory Steps.fromJson(Map<String, dynamic> json) {
    return _$StepsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StepsToJson(this);
  }
}
