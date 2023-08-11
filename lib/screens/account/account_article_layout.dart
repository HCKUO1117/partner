import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/account_article_controller.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/translation.dart';

class AccountArticleLayout extends StatelessWidget {
  const AccountArticleLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountArticleController = Get.put(AccountArticleController());
    accountArticleController.fetchArticle(1);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Constants.primaryOrange,
                  tabs: [
                    Tab(
                      text: Messages.myArticles.tr,
                    ),
                    Tab(
                      text: Messages.myCollection.tr,
                    ),
                  ],
                  onTap: accountArticleController.changeTabIndex,
                ),
              ],
            ),
          ),
          Obx(
            () => Card(
              elevation: 0,
              child: IndexedStack(
                index: accountArticleController.selectedTabIndex.value,
                children: [
                  _myArticle(),
                  _myCollection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _myArticle() {
    AccountArticleController accountArticleController = Get.find();
    return Obx(
      () => LoadingLayout(
        fixedSize: Constants.maxWidth,
        state: accountArticleController.articleState.value,
        child: Column(
          children: [
            SizedBox(
              height: 16,
              width: double.maxFinite,
            ),
            Text('1'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _myCollection() {
    return Column(
      children: [
        SizedBox(
          height: 16,
          width: double.maxFinite,
        ),
        Text('2'),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
