// import 'package:flutter/material.dart';
// import 'package:flutter_cook/widgets/top_bar.dart';
// import '../../../../widgets/user_msg_row.dart';

// /// 消息列表
// class MsgDetailListPage extends StatefulWidget {
//   final String? title;

//   final String? msgTitle;
//   final String? msgDesc;
//   final bool? reverse;
//   final int? itemCount;

//   const MsgDetailListPage({
//     Key? key,
//     this.title,
//     this.msgTitle,
//     this.msgDesc,
//     this.reverse,
//     this.itemCount,
//   }) : super(key: key);
//   @override
//   _MsgDetailListPageState createState() => _MsgDetailListPageState();
// }

// class _MsgDetailListPageState extends State<MsgDetailListPage> {
//   @override
//   Widget build(BuildContext context) {
//     Widget body = ListView.builder(
//       padding: EdgeInsets.only(
//         bottom: 80 + MediaQuery.of(context).padding.bottom,
//       ),
//       itemCount: widget.itemCount, // 行组件个数
//       itemBuilder: (_, __) => UserMsgRow(
//         title: widget.msgTitle,
//         desc: widget.msgDesc,
//       ),
//     );
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           children: <Widget>[
//             TopBar(title: "列表"),
//             Expanded(child: body),
//           ],
//         ),
//       ),
//     );
//   }
// }
