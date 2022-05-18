import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/util/string_util.dart';

/// 可滑动的菜谱Item，首页推荐使用
class SlideItem extends StatelessWidget {
  final Cook cook;

  SlideItem({
    Key? key,
    required this.cook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String img = "${(cook.recipeImage ?? '')}";
    return GestureDetector(
      onTap: () {
        NavigatorManager.goCookDetail(context, cook.id!);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.9,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 3.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.7,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container(
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "${cook.name ?? '菜谱'}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "${cook.story ?? '简介'}",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
