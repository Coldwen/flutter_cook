import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/route/route_handlers.dart';

class Routes {
  static String index = "/";
  static String login = "/login";
  static String home = "/home";
  static String categories = "/categories";
  static String setting = "/setting";
  static String cartScreen = "/cart_screen";
  static String fans = "/fans";
  static String follow = "/follow";
  static String cookList = "/cook_list";
  static String trending = "/trending";
  static String detail = "/detail";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: Text('catch error'),
        ),
      );
    });

    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画，可以看上图
    /// 这边先不设置默认的转场动画，转场动画在另一边，可以在另外一个地方设置（可以看NavigatorUtil类）
    router.define(index, handler: indexHandler);
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(categories, handler: categoriesHandler);
    router.define(setting, handler: settingHandler);
    router.define(cartScreen, handler: cartScreenHandler);
    router.define(fans, handler: fansHandler);
    router.define(follow, handler: followHandler);
    router.define(cookList, handler: cookListHandler);
    router.define(trending, handler: trendingHandler);
    router.define(detail, handler: detailHandler);
  }
}
