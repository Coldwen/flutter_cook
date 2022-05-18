import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';

import '../../widget/text_widget.dart';

class DurationView extends StatefulWidget {
  final Cook cook;

  const DurationView({Key? key, required this.cook}) : super(key: key);

  @override
  State<DurationView> createState() => _DurationViewState();
}

class _DurationViewState extends State<DurationView> {
  List duration = [
    '15分钟左右',
    '15~30分钟',
    '30~60分钟',
    '1小时以上',
    '2小时以上',
  ];

  int? selectIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            '烹饪时长',
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
              children: List.generate(duration.length, (index) {
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
                        child: TextWidget(duration[index]),
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

  ///选择时长
  _picker(int index) {
    if (selectIndex == index) {
      selectIndex = null;
    } else {
      selectIndex = index;
      widget.cook.duration = duration[index];
    }

    setState(() {});
  }
}
