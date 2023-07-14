import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/size_controller.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/widgets/search_bar.dart';

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
            children: [
              ///下方頁面
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    height: sizeController.width > 600 ? 90 : 150,
                    width: double.maxFinite,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                    if (sizeController.width > 600)
                      Flexible(
                        child: Column(
                          children: [
                            const SizedBox(height: 13),
                            SearchBar(
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
                  const SizedBox(height: 22),
                  if (userController.isLogin)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Material(
                        color: Colors.transparent,
                        child: PopupMenuButton(
                          onSelected: (v) {
                            AppRouterDelegate.of(context).pushNamed('/account');
                            // HtmlUtils.push(Constants.accountRoute);
                            // Navigator.pushNamed(context, Constants.accountRoute);
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 1,
                              child: Text('123'),
                            )
                          ],
                          tooltip: '',
                          position: PopupMenuPosition.under,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Constants.primaryOrange,
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.person_outline,
                              size: 30,
                              color: Constants.primaryOrange,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            AppRouterDelegate.of(context).pushNamed('/account');
                          },
                          child: Text(
                            '登入',
                            style: TextStyle(
                              color: Constants.primaryOrange,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            AppRouterDelegate.of(context).pushNamed('/account');
                          },
                          child: Text(
                            '註冊',
                            style: TextStyle(
                              color: Constants.primaryOrange,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          if (sizeController.width <= 600)
            Flexible(
              child: Column(
                children: [
                  const SizedBox(height: 13),
                  SearchBar(
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
