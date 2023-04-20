import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/widgets/menu_list_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashFactory: NoSplash.splashFactory,
                    child: Image.asset(
                      'assets/images/logo_hori.png',
                      height: 70,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            color: Constants.primaryOrange,
            child: Row(
              children: [
                MenuListButton(
                  onTap: () {},
                  text: '首頁',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
