import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/screens/account/account_page.dart';
import 'package:partner/screens/home_screen.dart';
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
        path: '/404',
        builder: () => const UnknownScreen(),
      );
  }
}
