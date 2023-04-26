import 'package:flutter/material.dart';
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
    case '/':
      return RoutePage(
        name: "首頁",
        path: name,
        builder: () => const HomeScreen(),
      );
    case '/account':
      return RoutePage(
        name: "帳戶",
        path: name,
        builder: () => const AccountPage(),
      );
    default:
      return RoutePage(
        name: 'Unknwon',
        path: '/404',
        builder: () => const UnknownScreen(),
      );
  }
}
