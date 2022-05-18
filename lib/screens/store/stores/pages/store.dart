import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/goods.dart';
import 'package:flutter_cook/services/cart_service.dart';
import 'package:flutter_cook/services/goods_service.dart';
import 'package:flutter_cook/widgets/cook_refresher_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widget/search_app_bar.dart';
import '../widget/goods.dart';

/// 商店页面
class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  late int page;

  late RefreshController _refreshController;

  late List<GoodsModel> goods;

  String? keyword;

  @override
  void initState() {
    super.initState();
    goods = [];
    page = 1;
    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        //清除title左右padding，默认情况下会有一定的padding距离
        toolbarHeight: 44,
        //将高度定到44，设计稿的高度。为了方便适配，
        backgroundColor: Colors.white,
        elevation: 0,
        //由于title本身是接受一个widget，所以可以直接给他一个自定义的widget。
        title: SearchAppBar(
          hintLabel: "搜索..",
          onChanged: (String value) {
            keyword = value;
            _refreshController.requestRefresh();
          },
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CookRefresherFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return Goods(
              goodsModel: goods[index],
              onTap: () {
                CartService.addGoods(goods[index]);
              },
            );
          },
          itemCount: goods.length,
        ),
      ),
    );
  }

  Future _onRefresh() async {
    page = 1;
    goods = await GoodsService.fetchGoods(key: keyword);
    if (mounted) setState(() {});
    _refreshController.refreshCompleted();
  }

  Future _onLoading() async {
    page++;
    // monitor network fetch
    final temp = await GoodsService.fetchGoods(page: page, key: keyword);
    goods.addAll(temp);
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
}

// Goods(
// imgUrl: "assets/food1.jpeg",
// title: "饺子",
// price: "￥10.20",
// widget: TextButton(
// onPressed: () {},
// child: Text("加入购物车"),
// ),
// ),
// Goods(
// imgUrl: "assets/food2.jpeg",
// title: "煎饼",
// price: "￥10.20",
// widget: TextButton(
// onPressed: () {},
// child: Text("加入购物车"),
// ),
// ),
// Goods(
// imgUrl: "assets/food3.jpeg",
// title: "鸡肉堡薯条",
// price: "￥10.20",
// widget: TextButton(
// onPressed: () {},
// child: Text("加入购物车"),
// ),
// ),
// Goods(
// imgUrl: "assets/food4.jpeg",
// title: "沙拉",
// price: "￥10.20",
// widget: TextButton(
// onPressed: () {},
// child: Text("加入购物车"),
// ),
// ),
// Goods(
// imgUrl: "assets/food5.jpeg",
// title: "牛肉堡",
// price: "￥10.20",
// widget: TextButton(
// onPressed: () {},
// child: Text("加入购物车"),
// ),
// ),
