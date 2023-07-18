import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/screens/common/layout_with_topper_page.dart';

enum AccountPagePath {
  account,
  info,
  resume,
  article,
  myCase,
  invite,
}

extension AccountPagePathEx on AccountPagePath {
  String get path {
    switch (this) {
      case AccountPagePath.account:
        return Constants.accountRoute;
      case AccountPagePath.info:
        return Constants.accountInfoRoute;
      case AccountPagePath.resume:
        return Constants.accountResumeRoute;
      case AccountPagePath.article:
        return Constants.accountArticleRoute;
      case AccountPagePath.myCase:
        return Constants.accountMyCasesRoute;
      case AccountPagePath.invite:
        return Constants.accountInviteRoute;
    }
  }

  String get name {
    switch (this) {
      case AccountPagePath.account:
        return Constants.accountRoute;
      case AccountPagePath.info:
        return Constants.accountInfoRoute;
      case AccountPagePath.resume:
        return Constants.accountResumeRoute;
      case AccountPagePath.article:
        return Constants.accountArticleRoute;
      case AccountPagePath.myCase:
        return Constants.accountMyCasesRoute;
      case AccountPagePath.invite:
        return Constants.accountInviteRoute;
    }
  }
}

class AccountPage extends StatefulWidget {
  final String path;

  const AccountPage({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutWithTopperPage(bottom: _content());
  }

  Widget _content() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: Constants.maxWidth),
      child: Row(
        children: const [Card(), Expanded(child: Card())],
      ),
    );
  }
}
