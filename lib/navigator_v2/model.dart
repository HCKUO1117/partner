import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/screens/account/account_page.dart';
import 'package:partner/screens/home/home_screen.dart';
import 'package:partner/screens/unknown.dart';

class RoutePage extends RouteSettings {
  final Function? builder;

  final String? path;

  Widget get widget => builder!();

  const RoutePage({
    required String name,
    Object? arguments,
    this.builder,
    this.path,
  }) : super(name: name, arguments: arguments);

  RoutePage.widget(Widget widget) : this(name: 'widget', builder: () => widget);
}

RoutePage getRoutePage({required String name}) {
  switch (name) {
    case Constants.homeRoute:
      return RoutePage(
        name: "首頁",
        path: name,
        builder: () => HomeScreen(),
      );
    case Constants.accountRoute:
    case Constants.accountInfoRoute:
    case Constants.accountResumeRoute:
    case Constants.accountArticleRoute:
    case Constants.accountMyRecruitRoute:
    case Constants.accountInviteRoute:
      if (name == Constants.accountRoute) {
        name = Constants.accountInfoRoute;
      }
      final UserController userController = Get.find();
      AccountPagePath path = AccountPagePath.info;
      if (AccountPagePath.values.indexWhere((element) => element.path == name) != -1) {
        path = AccountPagePath.values.firstWhere((element) => element.path == name);
      }
      userController.fetch(path);
      return RoutePage(
        name: "帳戶",
        path: name,
        builder: () => AccountPage(
          path: name,
        ),
      );
    default:
      return RoutePage(
        name: 'Unknown',
        path: name,
        builder: () => const UnknownScreen(),
      );
  }
}
