import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/screens/home/pages/recomend/data.dart';

/// 分类（分类、展开、Item）的Widget
class Categories extends StatefulWidget {
  final int index;

  const Categories({Key? key, this.index = 0}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [];
  List<Food> foods = [];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    final fds = initFood();
    foods.addAll(fds);
    tabs.addAll(fds.map((e) => e.name).toList());
    logger.v(widget.index);
    tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('分类'),
        centerTitle: true,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: ExtendedTabBar(
              scrollDirection: Axis.vertical,
              controller: tabController,
              isScrollable: true,
              mainAxisAlignment: MainAxisAlignment.start,
              indicatorColor: Colors.blue,
              indicatorWeight: 2.0,
              tabs: tabs
                  .map((e) => ExtendedTab(
                        text: e,
                        scrollDirection: Axis.horizontal,
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: ExtendedTabBarView(
              scrollDirection: Axis.vertical,
              controller: tabController,
              children: foods.map((e) => buildItem(e.foods!)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(List<Food> foods) {
    return GridView.builder(
      itemCount: foods.length,
      padding: EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            NavigatorManager.goCookListPage(context, foods[index].name);
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  foods[index].url!,
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      foods[index].name,
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
