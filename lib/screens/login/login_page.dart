import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/screens/login/widget/input_field.dart';
import 'package:flutter_cook/screens/login/widget/login_header.dart';
import 'package:flutter_cook/services/login_service.dart';
import 'package:flutter_cook/util/string_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum LoginType {
  login,
  register,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginType loginType;

  String? mail;
  String? pwd;
  String? phone;
  String? sign;
  String? nickname;
  String? address;
  String? photo;

  @override
  void initState() {
    super.initState();
    loginType = LoginType.login;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (loginType == LoginType.login) {
          return true;
        } else {
          setState(() {
            loginType = LoginType.login;
          });
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset:true, // 输入框抵住键盘
        body: homeBody(),
      ),
    );
  }

  Widget homeBody() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 60),
            LoginHeader(
              path: photo,
              loginType: loginType,
              onChanged: (path) {
                photo = path;
              },
            ),
            const SizedBox(height: 50),
            loginType == LoginType.login
                ? Column(
                    children: [
                      InputField(
                        hint: '请输入账号',
                        icon: Icons.account_circle,
                        onChange: (String value) {
                          mail = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        hint: '请输入密码',
                        icon: Icons.lock,
                        onChange: (String value) {
                          pwd = value;
                        },
                        passwordVisible: true,
                      ),
                    ],
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InputField(
                            hint: '请输入账号',
                            icon: Icons.account_circle,
                            onChange: (String value) {
                              mail = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          InputField(
                            hint: '请输入密码',
                            icon: Icons.lock,
                            onChange: (String value) {
                              pwd = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          InputField(
                            hint: '请输入手机号',
                            icon: Icons.phone,
                            onChange: (String value) {
                              phone = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          InputField(
                            hint: '请输入签名',
                            icon: Icons.info_outline,
                            onChange: (String value) {
                              sign = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          InputField(
                            hint: '请输入昵称',
                            icon: Icons.drive_file_rename_outline,
                            onChange: (String value) {
                              nickname = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          InputField(
                            hint: '请输入地址',
                            icon: Icons.location_on_outlined,
                            onChange: (String value) {
                              address = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
            const SizedBox(height: 38),
            ElevatedButton(
              child: Text(loginType == LoginType.login ? "登陆" : '注册'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(120, 48)),
                elevation: MaterialStateProperty.all(20.0),
              ),
              onPressed: login,
            ),
            Visibility(
              visible: loginType == LoginType.login,
              child: TextButton(
                onPressed: () {
                  reset();
                  loginType = LoginType.register;
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: const Text(
                  "注册新账号",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  void reset() {
    Form.of(context)?.reset();
    mail = null;
    pwd = null;
    phone = null;
    sign = null;
    nickname = null;
    photo = null;
    address = null;
  }

  void login() async {
    if (mail.isStrEmpty() || pwd.isStrEmpty()) {
      Fluttertoast.showToast(msg: '账号或密码不可为空');
    }
    if (loginType == LoginType.login) {
      bool isSuccess = await LoginService.login(mail!, pwd!, context);
      if (isSuccess) {
        NavigatorManager.goHomePage(context);
      }
    } else {
      bool isSuccess = await LoginService.addUser(UserModel(
        mail: mail,
        password: pwd,
        phone: phone,
        sign: sign,
        address: address,
        nikeName: nickname,
        photo: photo,
      ));
      if (isSuccess) {
        Fluttertoast.showToast(msg: '注册成功');
      } else {
        Fluttertoast.showToast(msg: '注册失败,请检查账号是否已注册');
      }
      if (mounted) {
        setState(() {
          loginType = LoginType.login;
        });
      }
    }
  }
}
