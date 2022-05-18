import 'package:flutter/material.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/screens/home/pages/recomend/widget/recommend_cook_book_widget.dart';
import 'package:flutter_cook/screens/home/pages/trending.dart';
import '../../model/categories.dart';
import '../../../../widgets/category_item.dart';

class Reconmend extends StatelessWidget {

  const Reconmend({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              buildCaipuRow('今日推荐', context),
              SizedBox(height: 10.0),
              buildCaipuList(context), //
              SizedBox(height: 10.0),
              buildCategoryRow('分类', context),
              SizedBox(height: 10.0),
              buildCategoryList(context),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  /// Row(今日推荐，展开)
  buildCaipuRow(String caipu, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$caipu",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: Text(
            // "搜索按下去显示的页面",
            "展开",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            NavigatorManager.goTrending(context);
          },
        ),
      ],
    );
  }

  /// 推荐菜谱的List
  buildCaipuList(BuildContext context) {
    return RecommendCookBookWidget();
  }

  /// Row(分类，展开)
  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: Text(
            "展开",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            NavigatorManager.goCategories(context);
          },
        ),
      ],
    );
  }

  /// 分类的List
  buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];

          return GestureDetector(
            onTap: () {
              NavigatorManager.goCategories(context, index);
            },
            child: CategoryItem(
              cat: cat,
            ),
          );
        },
      ),
    );
  }
}
