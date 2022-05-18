import 'package:flutter/material.dart';

class EditTextWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int maxLines;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Function? onChanged;
  final TextInputAction? textInputAction;

  const EditTextWidget({
    Key? key,
    this.controller,
    this.hint = '',
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.onChanged,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      onChanged: (String text) => onChanged!(text),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
      ),
    );
  }
}
