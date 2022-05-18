import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/route/routes.dart';
import 'package:flutter_cook/util/const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 注册 fluro routes
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.initRouter(router);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Application.init();
  }

  @override
  void reassemble() {
    super.reassemble();
    Application.init();
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    Application.initRouter(router);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      onGenerateRoute: Application.router.generator,
    );
  }
}
