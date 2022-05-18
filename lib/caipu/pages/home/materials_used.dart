import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../widget/edit_text_widget.dart';
import '../../widget/text_widget.dart';

class MaterialsUsed extends StatefulWidget {
  final List<Useds> useds;

  const MaterialsUsed({Key? key, required this.useds}) : super(key: key);

  @override
  State<MaterialsUsed> createState() => _MaterialsUsedState();
}

class _MaterialsUsedState extends State<MaterialsUsed> {
  @override
  void initState() {
    super.initState();
    widget.useds.add(Useds());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            '用料',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          _buildUsed(),
          _buildAdd(),
        ],
      ),
    );
  }

  Widget _buildUsed() {
    return Column(
      children: List.generate(widget.useds.length, (index) {
        return Row(
          children: [
            Expanded(
              child: EditTextWidget(
                hint: '食材：如鸡蛋',
                onChanged: (text) =>
                    widget.useds[index].shicai = text.toString(),
              ),
            ),
            Expanded(
              child: EditTextWidget(
                hint: '用量：如1只',
                onChanged: (text) =>
                    widget.useds[index].count = text.toString(),
              ),
            ),
            Visibility(
              visible: index != 0,
              child: IconButton(
                onPressed: () => _removeStep(index),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 15,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  _buildAdd() {
    return TextWidget(
      '再增加一行',
      fontSize: 12,
      textColor: Colors.pink,
      onTap: () {
        widget.useds.add(Useds());
        setState(() {});
      },
    );
  }

  ///移除用料
  _removeStep(int index) {
    widget.useds.removeAt(index);
    setState(() {});
  }
}
