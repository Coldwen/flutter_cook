import 'package:flutter/material.dart';
import 'package:flutter_cook/model/comment.dart';
import 'package:flutter_cook/screens/home/pages/follow/follow_item.dart';
import 'package:flutter_cook/services/comment_service.dart';

import '../../../../util/style.dart';
import '../../../../widgets/tapped.dart';

/// 动态页
class FollowPage extends StatefulWidget {
  FollowPage({Key? key}) : super(key: key);

  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  late Future future;
  late List<Comment> data;

  @override
  void initState() {
    super.initState();
    data = [];
    future = initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (data.length == 0) {
              return Center(
                child: Text(
                  '暂无动态',
                  style: TextStyle(color: Colors.black54),
                ),
              );
            }
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return FollowItem(
                  data: data[index],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future initData() async {
    CommentInfo? commentInfo = await CommentService.receiveComment();
    if (commentInfo != null) {
      data = commentInfo.data!;
    }
  }
}

class _RowButton extends StatelessWidget {
  final IconData? iconData;
  final Color? color;
  final double? size;
  final String? title;
  final Function? onTap;

  const _RowButton({
    Key? key,
    this.iconData,
    this.size,
    this.title,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tapped(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Icon(
              iconData ?? Icons.favorite,
              size: size ?? SysSize.iconNormal,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                title ?? '??',
                style: StandardTextStyle.small,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
