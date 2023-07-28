import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/size_controller.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/utils/translation.dart';
import 'package:partner/utils/utils.dart';
import 'package:get/get.dart';

import 'navigator_v2/route_Information_parser.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouterDelegate _delegate = AppRouterDelegate();

  final AppRouterParser _parser = AppRouterParser();

  final SizeController sizeController = Get.put(SizeController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: Messages.defaultTitle.tr,
      debugShowCheckedModeBanner: false,
      builder: FlutterSmartDialog.init(),
      navigatorObservers: [
        FlutterSmartDialog.observer,
      ],
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('zh', 'TW'),
      routerDelegate: _delegate,
      routeInformationParser: _parser,
      theme: ThemeData(
        primarySwatch: Utils.createMaterialColor(Constants.primaryOrange),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Constants.primaryOrangeBackground,
        indicatorColor: Colors.white,
      ),
    );
  }
}
