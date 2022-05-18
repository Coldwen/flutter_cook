import 'package:fluro/fluro.dart';
import 'package:flutter_cook/screens/detail/cook_book_detail.dart';
import 'package:flutter_cook/screens/detail/cook_book_list_page.dart';
import 'package:flutter_cook/screens/home/pages/recomend/categories.dart';
import 'package:flutter_cook/screens/home/pages/trending.dart';
import 'package:flutter_cook/screens/index.dart';
import 'package:flutter_cook/screens/login/login_page.dart';
import 'package:flutter_cook/screens/main_screen.dart';
import 'package:flutter_cook/screens/profile/bar/setting/setting.dart';
import 'package:flutter_cook/screens/profile/user/fans_page.dart';
import 'package:flutter_cook/screens/profile/user/follow_page.dart' as user;
import 'package:flutter_cook/screens/store/cart/pages/card_screen.dart';

var indexHandler = Handler(handlerFunc: (context, params) {
  return Index();
});

var loginHandler = Handler(handlerFunc: (context, params) {
  return const LoginPage();
});

var homeHandler = Handler(handlerFunc: (context, params) {
  return MainScreen();
});

var categoriesHandler = Handler(handlerFunc: (context, params) {
  Map<String, dynamic> params = context!.arguments as Map<String, dynamic>;
  return Categories(
    index: params['index'] as int,
  );
});
var settingHandler = Handler(handlerFunc: (context, params) {
  return Setting();
});

var cartScreenHandler = Handler(handlerFunc: (context, params) {
  return CartScreen();
});

var fansHandler = Handler(handlerFunc: (context, params) {
  return FansPage();
});

var followHandler = Handler(handlerFunc: (context, params) {
  return user.FollowPage();
});
var cookListHandler = Handler(handlerFunc: (context, params) {
  Map<String, dynamic> params = context!.arguments as Map<String, dynamic>;
  return CookBookListPage(
    title: params['title'] as String,
  );
});
var trendingHandler = Handler(handlerFunc: (context, params) {
  return Trending();
});
var detailHandler = Handler(handlerFunc: (context, params) {
  Map<String, dynamic> params = context!.arguments as Map<String, dynamic>;
  return CookBookDetail(
    id: params['id'] as int,
  );
});
