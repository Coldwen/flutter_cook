// import 'package:flutter/material.dart';
// import 'package:flutter_cook/util/list.dart';

// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: EdgeInsets.all(
//         5.0,
//       ),
//       child: Column(
//         children: <Widget>[
//           const UserAccountsDrawerHeader(
//             accountName: Text('昵称'),
//             accountEmail: Text('个人介绍'),
//             currentAccountPicture: CircleAvatar(
//                 backgroundImage: NetworkImage(
//                     'https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316')),
//           ),
//           ListTile(
//             title: Text('关于我们'),
//             trailing: Icon(Icons.feedback),
//           ),
//           // 分割线控件
//           Divider(),
//           ListTile(
//             title: Text('系统设置'),
//             trailing: Icon(Icons.feedback),
//           ),
//           Expanded(
//             child: FoodList(), // ListView.builder(...)必须被包裹在 Expanded 里面
//           )
//           // FoodList(),
//         ],
//       ),
//     ) // ListView.builder() 在这里使用.
//         );

//   }
// }

// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   Profile({Key? key}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/screens/profile/bar/collect/collect.dart';
import 'package:flutter_cook/screens/profile/widget/user_header.dart';
import 'package:flutter_cook/services/login_service.dart';
import 'package:flutter_cook/widgets/cook_book_list.dart';

import '../../util/style.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TabController _tabController;

  late UserModel user;

  @override
  void initState() {
    super.initState();
    user = Application.userModel;
    updateConfig();
  }

  @override
  Widget build(BuildContext context) {
    // 顶部bar：收藏、消息、设置
    Widget bar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
        // 收藏
        IconButton(
          tooltip: '',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Collect()));
          },
          icon: Icon(
            Icons.favorite_outline,
            color: Colors.black,
          ),
        ),
        // 设置
        IconButton(
          tooltip: '设置',
          onPressed: () async {
            await NavigatorManager.goSetting(context);
            Application.saveUser(Application.userModel);
            if (mounted) {
              setState(() {
                user = Application.userModel;
              });
            }
          },
          icon: Icon(
            Icons.settings_outlined,
            color: Colors.black,
          ),
        )
      ],
    );

    // 头像
    Widget avatar = UserHeader(size: 74);

    // 昵称
    Widget nickName = Text(
      user.nikeName ?? '未命名',
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 25,
      ),
    );

    // 个性签名
    Widget sing = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: Text(
            user.sign ?? '暂未设置签名',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextGroup(
              '${user.follows ?? 0}',
              '关注',
              onTap: () {
                goFollow();
              },
            ),
            TextGroup(
              '${user.fans ?? 0}',
              '粉丝',
              onTap: () {
                goFans();
              },
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: bar,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                avatar,
                const SizedBox(width: 20),
                nickName,
              ], // ,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: sing,
          ),
          const SizedBox(height: 20),
          const Expanded(child: CookBookList(isSelf: true)), // 显示自己的菜谱，菜谱Item
        ],
      ),
    );
  }

  void updateConfig() async {
    user = Application.userModel;
  }

  void goFollow() async {
    await NavigatorManager.goFollowPage(context);
    user = Application.userModel;
    Application.saveUser(Application.userModel);
    setState(() {});
  }

  void goFans() async {
    await NavigatorManager.goFansPage(context);
    user = Application.userModel;
    Application.saveUser(Application.userModel);
    setState(() {});
  }
}

// 关注、粉丝数Wigdet
class TextGroup extends StatelessWidget {
  final String title, tag;
  final Color? color;
  final VoidCallback? onTap;

  const TextGroup(
    this.title,
    this.tag, {
    Key? key,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: StandardTextStyle.big.apply(color: color),
            ),
            Container(width: 4),
            Text(
              tag,
              style: StandardTextStyle.smallWithOpacity.apply(
                color: color?.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
