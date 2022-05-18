import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';

import '../../widget/edit_text_widget.dart';
import '../../widget/text_widget.dart';

class Tips extends StatelessWidget {
  final Cook cook;

  const Tips({Key? key, required this.cook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            '小贴士',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          EditTextWidget(
            hint: '这道菜还有哪些需要注意的细节和小技巧？',
            maxLines: 5,
            textInputAction: TextInputAction.newline,
            onChanged: (text) => cook.tips = text.toString(),
          )
        ],
      ),
    );
  }
}
