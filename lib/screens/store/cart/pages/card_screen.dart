import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cart.dart';
import 'package:flutter_cook/model/goods.dart';
import 'package:flutter_cook/screens/store/cart/widget/cart_item_card.dart';
import 'package:flutter_cook/services/cart_service.dart';
import 'package:flutter_cook/services/order_service.dart';
import '../widget/check_out_card.dart';

/// 购物车页面
class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Cart> goods;

  late double price;

  late Future future;

  @override
  void initState() {
    super.initState();
    price = 0;
    goods = [];
    future = initData();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: buildAppBar(context),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  itemCount: goods.length, // 商品个数
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Dismissible(
                      key: Key(goods[index].goodsId.toString()),
                      direction: DismissDirection.endToStart,
                      //只能从末尾往开始划掉
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: const [
                            Spacer(), // 让icon在左边，去掉后在右边
                            Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          CartService.deleteGoods(goods[index].id!);
                          goods.removeAt(index); // 删除商品，但是再进这个页面还是会有商品TODO
                          calculatePrice();
                        });
                      },
                      child: CartItemCard(cart: goods[index]),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CheckOutCard(
                price: price,
                carts: goods,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "购物车",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${goods.length} 件商品",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }

  void calculatePrice() {
    price = 0.0;
    for (Cart element in goods) {
      price +=
          (element.num ?? 1) * double.parse(element.goodsInfo?.price ?? '0.0');
    }
  }

  Future initData() async {
    goods = await CartService.fetchGoodsList() ?? [];
    price = 0;
    calculatePrice();
  }
}
