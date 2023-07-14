

import 'package:flutter/material.dart';
import 'package:partner/screens/common/layout_with_topper_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutWithTopperPage(bottom: const SizedBox());
  }
}
