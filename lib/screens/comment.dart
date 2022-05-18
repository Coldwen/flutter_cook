import 'package:flutter/material.dart';

import '../util/style.dart';

/// 评论，目前没用上
class Comment extends StatelessWidget {
  const Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(4),
            height: 4,
            width: 32,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Container(
            height: 24,
            alignment: Alignment.center,
            // color: Colors.white.withOpacity(0.2),
            child: Text(
              '8条评论',
              style: StandardTextStyle.normal,
            ),
          ),
          Expanded(
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              children: const <Widget>[
                _CommentRow(),
                _CommentRow(),
                _CommentRow(),
                // 评论输入框
                TextField(
                  /// 设置字体
                  style: TextStyle(
                    fontSize: 15,
                  ),

                  /// 设置输入框样式
                  decoration: InputDecoration(
                    hintText: '喜欢评价的人，做饭一定超好吃~',

                    /// 边框
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                        Radius.circular(50),
                      ),
                    ),

                    ///设置内容内边距
                    contentPadding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                    ),

                    /// 前缀图标
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

/// 评价列表
class _CommentRow extends StatelessWidget {
  const _CommentRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '刘华',
          style: StandardTextStyle.smallWithOpacity,
        ),
        Container(height: 2),
        Text(
          '这是一条模拟评论。',
          style: StandardTextStyle.normal,
        ),
      ],
    );
    Widget right = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.favorite,
          color: Colors.grey,
        ),
        Text(
          '54',
          style: StandardTextStyle.normal,
        ),
      ],
    );
    right = Opacity(
      opacity: 0.3,
      child: right,
    );
    var avatar = Container(
      margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
      child: Container(
        height: 36,
        width: 36,
        child: ClipOval(
          child: Image.asset(
            "assets/cm1.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: <Widget>[
          avatar,
          Expanded(child: info),
          right,
        ],
      ),
    );
  }
}
