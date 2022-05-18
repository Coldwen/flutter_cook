class CaipuModel {
  ///菜谱id
  late int caipuId;

  ///菜谱图
  late String caipuImage;

  ///菜谱视频
  String? caipuVideo;

  ///菜谱名称
  late String name;

  ///菜谱介绍
  String? caipuIntro;

  ///用料
  late String useds;

  ///步骤
  late String steps;

  ///贴士
  String? tips;

  ///烹饪时长
  late String duration;

  ///烹饪难度
  late String nandu;

  ///分类
  late String sort;

  ///创建时间
  late int createTime;

  ///修改时间
  late int patchTime;

  CaipuModel({
    required this.caipuId,
    required this.caipuImage,
    this.caipuVideo,
    required this.name,
    this.caipuIntro,
    required this.useds,
    required this.steps,
    this.tips,
    required this.duration,
    required this.nandu,
    required this.sort,
    required this.createTime,
    required this.patchTime,
  });

  CaipuModel.fromJson(Map<String, dynamic> json) {
    caipuId = json['caipuId'];
    caipuImage = json['caipuImage'];
    caipuVideo = json['caipuVideo'];
    name = json['name'];
    caipuIntro = json['caipuIntro'];
    useds = json['useds'];
    steps = json['steps'];
    tips = json['tips'];
    duration = json['duration'];
    nandu = json['nandu'];
    sort = json['sort'];
    createTime = json['createTime'];
    patchTime = json['patchTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['caipuId'] = caipuId;
    data['caipuImage'] = caipuImage;
    data['caipuVideo'] = caipuVideo;
    data['name'] = name;
    data['caipuIntro'] = caipuIntro;
    data['useds'] = useds;
    data['steps'] = steps;
    data['tips'] = tips;
    data['duration'] = duration;
    data['nandu'] = nandu;
    data['sort'] = sort;
    data['createTime'] = createTime;
    data['patchTime'] = patchTime;
    return data;
  }
}
