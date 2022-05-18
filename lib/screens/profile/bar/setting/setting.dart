import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/services/login_service.dart';
import 'package:flutter_cook/widgets/top_bar.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Application.userModel;
    Widget body = ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: 80 + MediaQuery.of(context).padding.bottom,
      ),
      children: <Widget>[
        _UserInfoRow(
          title: '昵称',
          content: userModel.nikeName ?? '暂无昵称',
          onChanged: (text) {
            Application.userModel.nikeName = text;
          },
        ),
        _UserInfoRow(
          title: '签名',
          content: userModel.sign ?? '暂无签名',
          onChanged: (text) {
            Application.userModel.sign = text;
          },
        ),
        _UserInfoRow(
          title: '邮箱',
          content: userModel.mail!,
          enable: false,
        ),
        _UserInfoRow(
          title: '电话',
          content: userModel.phone ?? '未知',
          onChanged: (text) {
            Application.userModel.phone = text;
          },
        ),
        _UserInfoRow(
          title: '地址',
          content: userModel.address ?? '未知',
          onChanged: (text) {
            Application.userModel.address = text;
          },
        ),
        _UserInfoRow(
          title: '密码',
          content: '********',
          enable: false,
        ),
      ],
    );
    body = Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: body,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          TopBar(
            title: "设置",
            onTap: () async {
              await LoginService.updateUser(Application.userModel);
              Navigator.of(context).pop();
            },
          ),
          body,
          Spacer(),
          GestureDetector(
            onTap: () {
              Application.clear();
              NavigatorManager.goLoginPage(context, true, true, true);
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text('退出登陆'),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _UserInfoRow extends StatefulWidget {
  const _UserInfoRow({
    this.title,
    this.onChanged,
    this.content,
    this.enable = true,
    Key? key,
  }) : super(key: key);

  final bool? enable;
  final String? content;
  final String? title;
  final ValueChanged<String>? onChanged;

  @override
  State<_UserInfoRow> createState() => _UserInfoRowState();
}

class _UserInfoRowState extends State<_UserInfoRow> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.content ?? '');
  }

  @override
  Widget build(BuildContext context) {
    Widget row = Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(31, 255, 255, 255)),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              widget.title!,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: TextField(
              autofocus: false,
              enabled: widget.enable,
              controller: controller,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );

    return row;
  }
}
