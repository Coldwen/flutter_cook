import 'package:flutter/material.dart';
import 'package:flutter_cook/screens/comment.dart';

import '../util/style.dart';

/// 假的添加菜谱页面，没用上。里面有使用评论组件
class FoodDetail extends StatefulWidget {
  FoodDetail({Key? key, required this.id, required this.title})
      : super(key: key);

  final String id;
  final String title;
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('凉菜'),
        centerTitle: true,
      ),
      // appBar: AppBar(title: Text(widget.title),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: const NetworkImage(
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1113%2F062320091454%2F200623091454-2-1200.jpg&refer=http%3A%2F%2Flmg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650013998&t=7713ba5e6819b81f98d1b544c10a4254"),
                    fit: BoxFit.cover),
              ),
            ),
            const UserAccountsDrawerHeader(
              accountName: Text('昵称'),
              accountEmail: Text('菜单详情'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316')),
            ),
            ListTile(
              title: Text('鸡蛋'),
              trailing: Text('1个'),
            ),
            ListTile(
              title: Text('鸡蛋'),
              trailing: Text('1个'),
            ),
            ListTile(
              title: Text('鸡蛋'),
              trailing: Text('1个'),
            ),
            ListTile(
              title: Text('鸡蛋'),
              trailing: Text('1个'),
            ),
            ListTile(
              title: Text('青菜'),
              trailing: Text('1颗'),
            ),
            ListTile(
              title: Text('肉'),
              trailing: Text('100g'),
            ),
            // 分割线控件
            Divider(),
            Container(
              height: 340,
              child: Column(children: <Widget>[
                ListTile(
                  title: Text('第一步'),
                ),
                Image(
                    image: const NetworkImage(
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1113%2F062320091454%2F200623091454-2-1200.jpg&refer=http%3A%2F%2Flmg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650013998&t=7713ba5e6819b81f98d1b544c10a4254"),
                    fit: BoxFit.cover),
                Text(
                  '将肉放水里煮熟，放点盐。将肉放水里煮熟，放点盐。将肉放水里煮熟，放点盐。',
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ]),
            ),
            Divider(),
            Container(
              height: 340,
              child: Column(children: <Widget>[
                ListTile(
                  title: Text('第二步'),
                ),
                Image(
                    image: const NetworkImage(
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1113%2F062320091454%2F200623091454-2-1200.jpg&refer=http%3A%2F%2Flmg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1650013998&t=7713ba5e6819b81f98d1b544c10a4254"),
                    fit: BoxFit.cover),
                Text(
                  '将肉放水里煮熟，放点盐。将肉放水里煮熟，放点盐。将肉放水里煮熟，放点盐。',
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ]),
            ),
            Divider(),
            Container(
              height: 26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "这道菜的评价",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "全部",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (BuildContext context) {
                          //   return Trending();
                          // },
                          builder: ((BuildContext context) => Comment()), //评论组件
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: Column(children: <Widget>[
                // ListTile(
                //   title: Text('这道菜的评价'),
                // ),
                Expanded(
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    children: <Widget>[
                      _CommentRow(),
                      _CommentRow(),
                      _CommentRow(),
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

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
          '刷屏的超级好吃。',
          style: StandardTextStyle.normal,
        ),
      ],
    );
    // Widget right = Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       '54',
    //       style: StandardTextStyle.normal,
    //     ),
    //   ],
    // );
    // right = Opacity(
    //   opacity: 0.3,
    //   child: right,
    // );
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
          // right,
        ],
      ),
    );
  }
}
