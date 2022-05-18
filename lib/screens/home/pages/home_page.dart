import 'package:flutter/material.dart';
import 'package:flutter_cook/screens/home/pages/follow/follow_page.dart';
import 'package:flutter_cook/screens/home/pages/recomend/reconmend.dart';

import '../search/search_card.dart';

// tabbar
const List<Widget> _tabs = [
  const Tab(text: '动态'),
  const Tab(text: '推荐'),
];

// tabbarView
final List<Widget> _tabsContent = [
  FollowPage(),
  Reconmend(),
];

/// App进入的首页（包含搜索、关注/推荐TabBar）
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: _tabs.length, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchCard(isHome: true), // 搜索框
        bottom: TabBar(
          tabs: _tabs,
          labelColor: Colors.black,
          controller: _tabController,
          isScrollable: true,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      // 切换关注和推荐的TabBar
      body: TabBarView(
        children: _tabsContent,
        controller: _tabController,
      ),
      backgroundColor: Colors.white,
    );
  }
}
