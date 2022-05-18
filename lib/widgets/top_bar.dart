import 'package:flutter/material.dart';
import 'package:flutter_cook/widgets/tapped.dart';

import '../util/style.dart';

/// 个人页面的返回Bar，可看收藏、消息、设置
class TopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TopBar({Key? key, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.white,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Tapped(
            child: Container(
              color: Colors.white.withOpacity(0),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            title,
            // textAlign: TextAlign.center,
            style: StandardTextStyle.big,
          ),
          Spacer(),
          if (onTap != null)
            Tapped(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Icon(
                  Icons.done,
                  size: 20,
                ),
              ),
              onTap: onTap,
            ),
        ],
      ),
    );
  }
}
