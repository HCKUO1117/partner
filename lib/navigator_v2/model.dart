import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/screens/account/account_page.dart';
import 'package:partner/screens/home/home_screen.dart';
import 'package:partner/screens/unknown.dart';
import 'package:partner/utils/translation.dart';

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
  if (name.endsWith('/') && name.length > 1) {
    name = name.substring(0, name.length - 1);
  }
  switch (name) {
    case Constants.homeRoute:
      return RoutePage(
        name: name,
        path: name,
        builder: () => Title(
          title: Messages.defaultTitle.tr,
          color: Colors.black,
          child: HomeScreen(),)
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
        name: name,
        path: name,
        builder: () => Title(
          title: path.name,
          color: Colors.black,
          child: AccountPage(
            path: path,
          ),
        ),
      );
    default:
      return RoutePage(
        name: name,
        path: name,
        builder: () => Title(
          title: Messages.error.tr,
          color: Colors.black,
          child: const UnknownScreen(),
        ),
      );
  }
}
