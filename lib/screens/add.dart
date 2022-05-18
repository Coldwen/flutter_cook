import 'package:flutter/material.dart';
import 'package:flutter_cook/caipu/pages/home/home_page.dart';
import 'package:flutter_cook/screens/comment.dart';

import 'detail.dart';

/// 添加菜谱
class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
    // return FoodDetail(id: "", title: "好吃");
    return FoodDetail(
      id: '1',
      title: '2',
    ); // 点击中间的加号，显示假的菜谱页面，里面有评论
  }
}
