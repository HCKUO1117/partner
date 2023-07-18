import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/screens/common/layout_with_topper_page.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/translation.dart';
import 'package:partner/widgets/list_button.dart';

enum AccountPagePath {
  info,
  resume,
  article,
  myRecruit,
  invite,
}

extension AccountPagePathEx on AccountPagePath {
  String get path {
    switch (this) {
      case AccountPagePath.info:
        return Constants.accountInfoRoute;
      case AccountPagePath.resume:
        return Constants.accountResumeRoute;
      case AccountPagePath.article:
        return Constants.accountArticleRoute;
      case AccountPagePath.myRecruit:
        return Constants.accountMyRecruitRoute;
      case AccountPagePath.invite:
        return Constants.accountInviteRoute;
    }
  }

  String get name {
    switch (this) {
      case AccountPagePath.info:
        return Messages.memberInfo.tr;
      case AccountPagePath.resume:
        return Messages.myResume.tr;
      case AccountPagePath.article:
        return Messages.myArticles.tr;
      case AccountPagePath.myRecruit:
        return Messages.myRecruits.tr;
      case AccountPagePath.invite:
        return Messages.invites.tr;
    }
  }
}

class AccountPage extends StatelessWidget {
  final String path;

  AccountPage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutWithTopperPage(bottom: _content(context));
  }

  Widget _content(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: Constants.maxWidth),
      child: Row(
        children: [
          Card(
            child: IntrinsicWidth(
              child: Column(
                children: [
                  for (var element in AccountPagePath.values)
                    ListButton(
                      title: element.name,
                      selected: path == element.path,
                      onTap: () {
                        AppRouterDelegate.of(context).pushNamed(element.path);
                      },
                    )
                ],
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: LoadingLayout(
                state: userController.accountPageState.value,
                child: Card(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
