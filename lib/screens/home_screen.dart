import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/widgets/menu_list_button.dart';
import 'package:partner/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class ExampleItem {
  final String title;

  ExampleItem({
    required this.title,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
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
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: SearchBar(
                          onSearch: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Material(
                    color: Colors.transparent,
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
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
                ),
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
                  text: '活動',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
