import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../util/picker_media.dart';
import '../../widget/edit_text_widget.dart';
import '../../widget/text_widget.dart';

class StepView extends StatefulWidget {
  final List<Steps> steps;

  const StepView({Key? key, required this.steps}) : super(key: key);

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  @override
  void initState() {
    super.initState();
    widget.steps.add(Steps());
    widget.steps.add(Steps());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            '做法',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          _buildStep(),
          const SizedBox(height: 10),
          _buildAdd(),
        ],
      ),
    );
  }

  _buildStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.steps.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _pickerImage(index),
              child: Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: widget.steps[index].image == null
                    ? _buildEmptyView()
                    : _buildImage(index),
              ),
            ),
            const SizedBox(height: 10),
            EditTextWidget(
              hint: '添加步骤说明，至少2步',
              textInputAction: TextInputAction.newline,
              maxLines: 2,
              onChanged: (text) => widget.steps[index].intro = text.toString(),
            ),
            Visibility(
              visible: index > 1,
              child: GestureDetector(
                onTap: () => _removeStep(index),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  color: Colors.red.withOpacity(.7),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  ///封面
  Widget _buildImage(int index) {
    return Image.network(
      widget.steps[index].image!,
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }

  ///未选择时的布局
  Column _buildEmptyView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '+步骤图',
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          '上传至少2张步骤图，会得到更多关注',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  _pickerImage(int index) async {
    String? path = await pickerMedia(context, type: FileType.image);
    if (path != null) widget.steps[index].image = path;
    setState(() {});
  }

  _buildAdd() {
    return TextWidget(
      '再增加一步',
      fontSize: 12,
      textColor: Colors.pink,
      onTap: () {
        widget.steps.add(Steps());
        setState(() {});
      },
    );
  }

  _removeStep(int index) {
    widget.steps.removeAt(index);
    setState(() {});
  }
}
