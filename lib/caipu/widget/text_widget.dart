import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Function()? onTap;

  const TextWidget(
    this.title, {
    Key? key,
    this.fontSize = 10,
    this.textColor,
    this.fontWeight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
