import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg,
    {ToastGravity gravity = ToastGravity.BOTTOM,
    Color bgColor = Colors.white,
    Color textColor = Colors.black}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: gravity,
    backgroundColor: bgColor,
    textColor: textColor,
  );
}
