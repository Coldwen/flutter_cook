import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/util/string_util.dart';

// 个人菜谱
class CookBookItem extends StatelessWidget {
  final Cook cook;

  final VoidCallback? onTap;

  const CookBookItem({
    Key? key,
    required this.cook,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: cook.recipeImage ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container(color: Colors.black12);
                      },
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    (cook.name ?? '').defaultStr('菜谱'),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    (cook.story ?? '').defaultStr('暂无简介'),
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
