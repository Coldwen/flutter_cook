import 'package:flutter/material.dart';

/// 输入框
Widget inputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 44,
    margin: EdgeInsets.only(top: marginTop),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 44,
    margin: EdgeInsets.only(top: marginTop),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
