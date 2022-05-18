import 'package:flutter/material.dart';
import '../util/style.dart';
import 'tapped.dart';

/// 消息的Item，用户关注和粉丝列表的Item
class UserMsgRow extends StatelessWidget {
  final Widget? lead; //头像
  final String? title; //用户昵称
  final String? desc; //消息内容
  const UserMsgRow({
    Key? key,
    this.title,
    this.desc,
    this.lead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[
      Text(
        title ?? '用户昵称',
        style: StandardTextStyle.normalW,
      ),
      Container(height: 2),
      Text(
        desc ?? '关注了你',
        style: StandardTextStyle.smallWithOpacity,
      ),
    ];
    var info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
    var right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '10-12',
          style: StandardTextStyle.smallWithOpacity,
        ),
      ],
    );
    var avatar = Container(
      margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
      child: Container(
        height: 40,
        width: 40,
        child: lead ??
            ClipOval(
              child: Image.asset(
                "assets/cm2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
      ),
    );
    return Tapped(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: <Widget>[
            avatar,
            Expanded(child: info),
            right,
          ],
        ),
      ),
    );
  }
}
