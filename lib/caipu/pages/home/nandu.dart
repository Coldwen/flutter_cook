import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';

import '../../widget/text_widget.dart';

class NanduView extends StatefulWidget {
  final Cook cook;

  const NanduView({Key? key, required this.cook}) : super(key: key);

  @override
  State<NanduView> createState() => _NanduViewState();
}

class _NanduViewState extends State<NanduView> {
  List nandu = [
    '零厨艺',
    '容易做',
    '有点挑战',
    '压力略大',
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
            '烹饪难度',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          _buildDuration(),
        ],
      ),
    );
  }

  _buildDuration() {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(nandu.length, (index) {
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
                        child: TextWidget(nandu[index]),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  ///选择难度
  _picker(int index) {
    if (selectIndex == index) {
      selectIndex = null;
    } else {
      selectIndex = index;
      widget.cook.difficulty = nandu[index];
    }
    setState(() {});
  }
}
