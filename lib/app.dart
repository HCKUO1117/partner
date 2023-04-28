import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/utils/utils.dart';
import 'package:get/get.dart';

import 'navigator_v2/route_Information_parser.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouterDelegate _delegate = AppRouterDelegate();
  final AppRouterParser _parser = AppRouterParser();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Partner 找夥伴、找活動、學技能',
      debugShowCheckedModeBanner: false,
      routerDelegate: _delegate,
      routeInformationParser: _parser,
      theme: ThemeData(
          primarySwatch: Utils.createMaterialColor(Constants.primaryYellow),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Constants.primaryOrangeBackground,
          indicatorColor: Colors.white),
    );
  }
}
