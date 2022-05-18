import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    readConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  void readConfig() async {
    UserModel userModel = await Application.getUser();
    if (userModel.id == null) {
      NavigatorManager.goLoginPage(context, true);
    } else {
      NavigatorManager.goHomePage(context, true);
    }
  }
}
