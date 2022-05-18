import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cart.dart';
import 'package:flutter_cook/model/goods.dart';
import 'package:flutter_cook/screens/store/stores/pages/store.dart';
import 'package:flutter_cook/services/order_service.dart';

import '../../../../caipu/util/toast.dart';

/// 结算Widget
class CheckOutCard extends StatelessWidget {
  final double price;
  final List<Cart> carts;

  const CheckOutCard({
    Key? key,
    required this.price,
    required this.carts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      // height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.list),
                ),
                Spacer(), // 自动布局，填充空余的
                // Text("付费"),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "总价:\n",
                    children: [
                      TextSpan(
                        text: "\￥$price",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 100.0,
                  // color: Colors.grey,
                  child: new ElevatedButton(
                    onPressed: () async {
                      if (carts.length > 0) {
                        showToast("支付成功"); // 购物车清零，总价清零
                        await OrderService.addOrder(carts);
                        Navigator.of(context).pop();
                      } else {
                        showToast('还未选择商品');
                      }
                    },
                    child: new Text("支付"),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 16)), //字体
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
