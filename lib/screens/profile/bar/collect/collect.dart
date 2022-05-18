import 'package:flutter/material.dart';

import '../../../../widgets/top_bar.dart';
import '../../widget/caipuTable.dart';

class Collect extends StatefulWidget {
  Collect({Key? key}) : super(key: key);

  @override
  State<Collect> createState() => _CollectState();
}

class _CollectState extends State<Collect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        TopBar(title: "收藏"),
        Expanded(child: CaipuTable()), // 显示收藏的菜谱，菜谱Item
      ],
    ));
  }
}
