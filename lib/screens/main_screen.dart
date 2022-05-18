import 'package:flutter/material.dart';
import 'package:flutter_cook/screens/add.dart';
import 'package:flutter_cook/screens/home/pages/home_page.dart';
import 'package:flutter_cook/screens/store/stores/pages/store.dart';
import 'package:flutter_cook/screens/profile/profile.dart';

import 'orders/pages/orders.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  int _page = 0;

  List icons = [
    Icons.home,
    Icons.store,
    Icons.add,
    Icons.assignment,
    Icons.person,
  ];

  List pages = [
    HomePage(), // 首页
    Store(), // 商店
    Add(), // 添加菜谱
    Orders(), // 订单
    Profile(), // 我的：个人信息页
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) => pages[index]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // SizedBox(width: 7),
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(3),
            buildTabIcon(4),
            // SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _pageController.jumpToPage(2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  buildTabIcon(int index) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).accentColor
            : Theme.of(context).textTheme.caption?.color,
        onPressed: () => _pageController.jumpToPage(index),
      ),
    );
  }
}
