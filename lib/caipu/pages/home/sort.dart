import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';

import '../../widget/text_widget.dart';

class SortView extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final Cook cook;

  const SortView({Key? key, this.onChanged, required this.cook})
      : super(key: key);

  @override
  State<SortView> createState() => _SortViewState();
}

class _SortViewState extends State<SortView> {
  List sort = [
    '蔬菜',
    '沙拉',
    '小吃',
    '甜品',
    '便当',
    '蛋糕',
    '川菜',
    '湘菜',
    '鲁菜',
    '西餐',
    '日式',
    '韩式',
    '海鲜',
    '水果',
    '奶类',
    '哄娃',
    '奶类',
    '夏天',
  ];

  int? selectIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            '分类',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          _buildSort(),
        ],
      ),
    );
  }

  _buildSort() {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(sort.length, (index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => _picker(index),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: selectIndex == index
                              ? Colors.blue
                              : Colors.grey[200],
                        ),
                        alignment: Alignment.center,
                        child: TextWidget(sort[index]),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  ///选择分类
  _picker(int index) {
    if (selectIndex == index) {
      selectIndex = null;
    } else {
      selectIndex = index;
      widget.cook.sort = sort[index];
    }
    setState(() {});
  }
}
