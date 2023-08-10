import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/size_controller.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/utils/translation.dart';
import 'package:partner/widgets/menu_list_button.dart';

import '../../widgets/search_bar.dart';

class LayoutWithTopperPage extends StatelessWidget {
  final Widget bottom;

  LayoutWithTopperPage({
    Key? key,
    required this.bottom,
  }) : super(key: key);

  ///getX
  final SizeController sizeController = Get.find();
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      sizeController.width(MediaQuery.of(context).size.width);
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ///下方頁面
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    height: sizeController.width > Constants.secondChangeWidth ? 90 : 150,
                    width: double.maxFinite,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 60,
                        width: double.maxFinite,
                        color: Constants.primaryOrange,
                      ),
                      Container(
                        height: 60,
                        constraints: const BoxConstraints(maxWidth: Constants.maxWidth),
                        child: Row(
                          children: [
                            MenuListButton(
                              onTap: () {},
                              text: Messages.home.tr,
                              highlight: true,
                            ),
                            MenuListButton(
                              onTap: () {},
                              text: Messages.recruit.tr,
                            ),
                            MenuListButton(
                              onTap: () {},
                              text: Messages.talents.tr,
                            ),
                            MenuListButton(
                              onTap: () {},
                              text: Messages.articles.tr,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottom
                ],
              ),

              ///上方欄位
              top(context),
            ],
          ),
        ),
      );
    });
  }

  Widget top(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxWidth: Constants.maxWidth),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {
                          AppRouterDelegate.of(context).pushNamed('/');
                        },
                        splashFactory: NoSplash.splashFactory,
                        child: Image.asset(
                          'assets/images/logo_hori.png',
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    if (sizeController.width > Constants.secondChangeWidth)
                      Flexible(
                        child: Column(
                          children: [
                            const SizedBox(height: 13),
                            MySearchBar(
                              onSearch: (value) {},
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  const SizedBox(height: 13),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          AppRouterDelegate.of(context).pushNamed(Constants.accountInfoRoute);
                        },
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                          color: Constants.primaryOrange,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          if (sizeController.width <= Constants.secondChangeWidth)
            Flexible(
              child: Column(
                children: [
                  const SizedBox(height: 13),
                  MySearchBar(
                    onSearch: (value) {},
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
