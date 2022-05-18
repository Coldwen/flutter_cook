import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cart.dart';

class CartItemCard extends StatelessWidget {
  final Cart cart;

  const CartItemCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 110,
              width: 110,
              child: Image.network(
                cart.goodsInfo?.photo ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 像开始对齐，左对齐
            children: [
              // 标题
              Text(
                cart.goodsInfo?.name ?? '未知',
                style: TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              // 价钱
              Text.rich(
                TextSpan(
                    text: "\￥${cart.goodsInfo?.price}",
                    style: const TextStyle(color: Colors.red),
                    children: [
                      TextSpan(
                          text: "  X${cart.num ?? 1}",
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
