import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/home_controller.dart';
import 'package:partner/controllers/size_controller.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/models/loading_status.dart';
import 'package:partner/screens/common/layout_with_topper_page.dart';
import 'package:partner/utils/utils.dart';
import 'package:partner/widgets/article_card.dart';
import 'package:partner/widgets/banner_widget.dart';
import 'package:partner/widgets/case_card.dart';
import 'package:partner/widgets/menu_list_button.dart';
import 'package:partner/widgets/person_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ///getX
  final HomeController homeController = Get.put(HomeController());
  final SizeController sizeController = Get.find();
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutWithTopperPage(bottom: bottom());
  }

  Widget bottom() {
    return Obx((){return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: double.maxFinite,
          color: Constants.primaryOrange,
          child: Row(
            children: [
              MenuListButton(
                onTap: () {},
                text: '首頁',
                highlight: true,
              ),
              MenuListButton(
                onTap: () {},
                text: '找需求',
              ),
              MenuListButton(
                onTap: () {},
                text: '找夥伴',
              ),
              MenuListButton(
                onTap: () {},
                text: '文章',
              ),
            ],
          ),
        ),
        BannerWidget(
          status: homeController.loadingStatusBanner.value,
          banners: homeController.banners,
        ),
        homePageBlock(
          title: '找需求',
          status: homeController.loadingStatusCase.value,
          child: DefaultTabController(
            length: homeController.caseCategoryList.length,
            child: Column(
              children: [
                if (homeController.caseTabController != null)
                  ButtonsTabBar(
                    controller: homeController.caseTabController,
                    backgroundColor: Constants.primaryOrange,
                    unselectedBackgroundColor: Colors.white,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Constants.primaryOrange,
                    ),
                    borderWidth: 1,
                    unselectedBorderColor: Constants.primaryOrange,
                    radius: 10,
                    borderColor: Constants.primaryOrange,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                    onTap: (index) {
                      homeController.caseCurrentTag(index);
                    },
                    tabs: [
                      for (int i = 0; i < homeController.caseCategoryList.length; i++)
                        Tab(
                          text: homeController.caseCategoryList[i].name,
                        )
                    ],
                  ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    controller: homeController.caseTabController,
                    children: [
                      for (int i = 0; i < homeController.caseCategoryList.length; i++)
                        Row(
                          children: [
                            for (int j = 0;
                            j <
                                (sizeController.width.value > 900
                                    ? homeController.caseCategoryList[i].cases!.length
                                    : sizeController.width.value > 600
                                    ? Utils.listLengthCounter(
                                  listLength: homeController
                                      .caseCategoryList[i].cases!.length,
                                  maxLength: 2,
                                )
                                    : Utils.listLengthCounter(
                                  listLength: homeController
                                      .caseCategoryList[i].cases!.length,
                                  maxLength: 1,
                                ));
                            j++)
                              Expanded(
                                child: CaseCard(
                                  model: homeController.caseCategoryList[i].cases![j],
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        homePageBlock(
          title: '找夥伴',
          status: homeController.loadingStatusPerson.value,
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 9 / 16,
            crossAxisCount: sizeController.width.value > 900
                ? 5
                : sizeController.width.value > 600
                ? 4
                : 3,
            children: [
              for (int i = 0;
              i <
                  (sizeController.width.value > 900
                      ? Utils.listLengthCounter(
                      listLength: homeController.personList.length, maxLength: 10)
                      : sizeController.width.value > 600
                      ? Utils.listLengthCounter(
                      listLength: homeController.personList.length, maxLength: 8)
                      : Utils.listLengthCounter(
                      listLength: homeController.personList.length, maxLength: 6));
              i++)
                PersonCard(
                  model: homeController.personList[i],
                ),
            ],
          ),
        ),
        homePageBlock(
          title: '文章',
          status: homeController.loadingStatusArticle.value,
          child: DefaultTabController(
            length: homeController.articleCategoryList.length,
            child: Column(
              children: [
                if (homeController.articleTabController != null)
                  ButtonsTabBar(
                    controller: homeController.articleTabController,
                    backgroundColor: Constants.primaryOrange,
                    unselectedBackgroundColor: Colors.white,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Constants.primaryOrange,
                    ),
                    borderWidth: 1,
                    unselectedBorderColor: Constants.primaryOrange,
                    radius: 10,
                    borderColor: Constants.primaryOrange,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                    onTap: (index) {
                      homeController.articleCurrentTag(index);
                    },
                    tabs: [
                      for (int i = 0; i < homeController.articleCategoryList.length; i++)
                        Tab(
                          text: homeController.articleCategoryList[i].name,
                        )
                    ],
                  ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    controller: homeController.articleTabController,
                    children: [
                      for (int i = 0; i < homeController.articleCategoryList.length; i++)
                        Row(
                          children: [
                            for (int j = 0;
                            j <
                                (sizeController.width.value > 900
                                    ? homeController.articleCategoryList[i].articles!.length
                                    : sizeController.width.value > 600
                                    ? Utils.listLengthCounter(
                                  listLength: homeController
                                      .articleCategoryList[i].articles!.length,
                                  maxLength: 2,
                                )
                                    : Utils.listLengthCounter(
                                  listLength: homeController
                                      .articleCategoryList[i].articles!.length,
                                  maxLength: 1,
                                ));
                            j++)
                              Expanded(
                                child: ArticleCard(
                                  model: homeController.articleCategoryList[i].articles![j],
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );});
  }

  Widget homePageBlock({
    required String title,
    required Widget child,
    required LoadingStatus status,
  }) {
    Widget body = const SizedBox();

    switch (status) {
      case LoadingStatus.finish:
        body = child;
        break;
      case LoadingStatus.loading:
        body = const Center(
          child: CircularProgressIndicator(),
        );
        break;
      case LoadingStatus.error:
        body = const Center(
          child: Text('錯誤'),
        );
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  '更多',
                  style: TextStyle(
                    color: Constants.primaryOrange,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          body,
        ],
      ),
    );
  }
}
