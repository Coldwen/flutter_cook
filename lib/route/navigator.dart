import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/route/routes.dart';

class NavigatorManager {
  static Future goLoginPage(
    BuildContext context, [
    bool replace = false,
    bool clearStack = false,
    bool rootNavigator = false,
  ]) {
    return Application.router.navigateTo(
      context,
      Routes.login,
      replace: replace,
      clearStack: clearStack,
      rootNavigator: rootNavigator,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goHomePage(BuildContext context, [bool replace = true]) {
    return Application.router.navigateTo(
      context,
      Routes.home,
      replace: replace,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goCategories(BuildContext context, [int index = 0]) {
    return Application.router.navigateTo(context, Routes.categories,
        transition: TransitionType.fadeIn,
        routeSettings: RouteSettings(
          arguments: {
            'index': index,
          },
        ));
  }

  static Future goSetting(BuildContext context) {
    return Application.router.navigateTo(
      context,
      Routes.setting,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goCartScreen(BuildContext context) {
    return Application.router.navigateTo(
      context,
      Routes.cartScreen,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goFansPage(BuildContext context) {
    return Application.router.navigateTo(
      context,
      Routes.fans,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goFollowPage(BuildContext context) {
    return Application.router.navigateTo(
      context,
      Routes.follow,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goCookListPage(BuildContext context, String title) {
    return Application.router.navigateTo(context, Routes.cookList,
        transition: TransitionType.fadeIn,
        routeSettings: RouteSettings(
          arguments: {
            'title': title,
          },
        ));
  }

  static Future goTrending(BuildContext context) {
    return Application.router.navigateTo(
      context,
      Routes.trending,
      transition: TransitionType.fadeIn,
    );
  }

  static Future goCookDetail(BuildContext context, int id) {
    return Application.router.navigateTo(context, Routes.detail,
        transition: TransitionType.fadeIn,
        routeSettings: RouteSettings(
          arguments: {
            'id': id,
          },
        ));
  }
}
