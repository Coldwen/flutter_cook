import 'package:flutter/material.dart';
import 'package:flutter_cook/model/goods.dart';

/// 商店页面的商品Item
class Goods extends StatelessWidget {
  final GoodsModel goodsModel;
  final VoidCallback onTap;

  const Goods({Key? key, required this.goodsModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              goodsModel.photo ?? '',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 5),
              child: Text(
                goodsModel.name ?? '未命名',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '¥${goodsModel.price ?? 0.0}',
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
            ),
            Expanded(
              child:Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "加入购物车",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
