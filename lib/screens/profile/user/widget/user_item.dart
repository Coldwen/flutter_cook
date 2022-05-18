import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/user.dart';

class UserItem extends StatelessWidget {
  final UserModel userModel;

  const UserItem({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            child: CachedNetworkImage(
              imageUrl: userModel.photo ?? '',
              width: 50,
              height: 50,
              errorWidget: (context, url, error) {
                return ColoredBox(color: Colors.black12);
              },
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userModel.nikeName ?? '未命名用户'),
                const SizedBox(height: 5),
                Text(
                  userModel.sign ?? '暂无签名',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
