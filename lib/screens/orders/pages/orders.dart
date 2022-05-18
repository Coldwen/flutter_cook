import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/order.dart';
import 'package:flutter_cook/services/order_service.dart';
import 'package:flutter_cook/widgets/cook_refresher_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 订单页面
class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late int page;

  late RefreshController _refreshController;

  late List<OrderModel> orders;

  @override
  void initState() {
    super.initState();
    orders = [];
    page = 1;
    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? textTextStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          '订单',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CookRefresherFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildOrderItem(
                    data: orders[index], textTextStyle: textTextStyle);
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  void _onRefresh() async {
    page = 1;
    orders = await OrderService.fetchOrders();
    logger.d(orders.toString());
    if (mounted) setState(() {});
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    page++;
    // monitor network fetch
    final temp = await OrderService.fetchOrders(page);
    orders.addAll(temp);
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
}

// 订单Item
class _buildOrderItem extends StatelessWidget {
  final OrderModel data;
  final TextStyle? textTextStyle;

  const _buildOrderItem({
    Key? key,
    required this.textTextStyle,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double price = calculatePrice();
    List<Widget> details = buildDetail(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 1.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 像开始对齐，左对齐
          children: [
            // 时间
            Row(
              children: [
                Text(
                  data.createdAt ?? "2022.04.02 20:50",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  maxLines: 1,
                ),
                Spacer(),
                Text(
                  '已完成',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                  maxLines: 1,
                ),
              ],
            ),
            Divider(),
            // 商品名称及数量
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...details,
              ],
            ),
            SizedBox(height: 20),
            // 价钱
            Align(
              alignment: Alignment.centerRight,
              child: Text.rich(
                TextSpan(
                    text: "\￥$price",
                    style: const TextStyle(color: Colors.red),
                    children: [
                      TextSpan(
                          text: "  共${data.goodsListInfo?.length ?? 0}件商品",
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculatePrice() {
    double price = 0.0;
    data.goodsListInfo?.forEach((element) {
      price += (element.num ?? 1) *
          double.parse('${element.goodsInfo?.price ?? 0.0}');
    });
    return price;
  }

  List<Widget> buildDetail(BuildContext context) {
    List<Widget> children = [];
    Widget text(GoodsListInfo info) => DefaultTextStyle.merge(
          style: textTextStyle,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  info.goodsInfo?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Text('x${info.num}',
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        );
    data.goodsListInfo?.forEach((element) {
      children.add(text(element));
      children.add(SizedBox(height: 5));
    });
    return children;
  }
}
