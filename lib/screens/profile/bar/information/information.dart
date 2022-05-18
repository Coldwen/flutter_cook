import 'package:flutter/material.dart';

import '../../../../widgets/top_bar.dart';
import '../../../../widgets/user_msg_row.dart';

class Information extends StatefulWidget {

  const Information({Key? key}):super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    /// 粉丝、点赞、评论的button
    // Widget topButtons = Container(
    //   width: double.infinity,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       _TopIconTextButton(
    //         title: '粉丝',
    //         icon: Icons.person_outline,
    //         color: Colors.white,
    //         color2: Colors.white,
    //         onTap: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(
    //               builder: (cxt) => MsgDetailListPage(
    //                 title: '关注列表',
    //                 msgTitle: '用户昵称',
    //                 msgDesc: '个性签名',
    //                 itemCount: 5,
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //       _TopIconTextButton(
    //         title: '赞',
    //         icon: Icons.favorite_outline,
    //         color: Colors.white,
    //         color2: Colors.white,
    //         onTap: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(
    //               builder: (cxt) => MsgDetailListPage(
    //                 title: '赞',
    //                 msgTitle: '你的粉丝',
    //                 msgDesc: '给你点了个赞',
    //                 itemCount: 2,
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //       _TopIconTextButton(
    //         title: '评论',
    //         icon: Icons.mode_comment_outlined,
    //         color: Colors.white,
    //         color2: Colors.white,
    //         onTap: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(
    //               builder: (cxt) => MsgDetailListPage(
    //                 title: '评论',
    //                 msgTitle: '粉丝的评论',
    //                 msgDesc: '你的粉丝',
    //                 reverse: true,
    //                 itemCount: 2,
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );

    Widget body = Expanded(
      child: ListView(
        children: <Widget>[
          // topButtons, // 粉丝、赞、评论按钮
          UserMsgRow(desc: "关注了你"),
          UserMsgRow(desc: "收藏了你的菜谱"),
          UserMsgRow(desc: "评价：你做的好好吃"),
        ],
      ),
    );
    body = Scaffold(
      body: Container(
        // color: Colors.white,
        child: Column(
          children: <Widget>[
            TopBar(
              title: "消息",
            ),
            body,
          ],
        ),
      ),
    );
    return body;
  }
}

// 粉丝列表内容
// class _TopIconTextButton extends StatelessWidget {
//   final IconData? icon;
//   final Color? color;
//   final Color color2;
//   final String? title;
//   final Function? onTap;

//   const _TopIconTextButton({
//     Key? key,
//     this.icon,
//     this.color,
//     this.title,
//     this.color2: Colors.white,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var iconContainer = Container(
//       margin: EdgeInsets.all(0),
//       height: 40,
//       width: 40,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(2),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomCenter,
//           colors: [
//             color2,
//             color!,
//           ],
//           stops: [0.1, 0.8],
//         ),
//       ),
//       child: Icon(
//         icon,
//       ),
//     );
//     Widget body = Column(
//       children: <Widget>[
//         iconContainer,
//         Text(
//           title!,
//           style: StandardTextStyle.small,
//         )
//       ],
//     );
//     body = Tapped(
//       child: body,
//       onTap: onTap,
//     );
//     return Expanded(
//       child: Container(
//         child: body,
//       ),
//     );
//   }
// }
