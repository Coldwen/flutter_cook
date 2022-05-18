import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/comment.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/util/style.dart';

class FollowItem extends StatelessWidget {
  final Comment data;

  const FollowItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.recipeId == null) return;
        NavigatorManager.goCookDetail(context, data.recipeId!);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 32,
                  width: 32,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: data.userInfo?.photo ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return ColoredBox(color: Colors.black12);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    data.userInfo?.nikeName ?? '未命名昵称',
                    style: StandardTextStyle.normal,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              data.des ?? '小编也不知道去哪里了...',
              style: StandardTextStyle.normal,
            ),
            SizedBox(height: 10),
            Text(
              data.createdAt ?? '2022.10.02',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
