import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/home_controller.dart';
import 'package:partner/controllers/size_controller.dart';
import 'package:partner/models/loading_status.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/widgets/banner_widget.dart';
import 'package:partner/widgets/case_card.dart';
import 'package:partner/widgets/menu_list_button.dart';
import 'package:partner/widgets/person_card.dart';
import 'package:partner/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();

  ///getX
  HomeController homeController = Get.put(HomeController());
  final SizeController sizeController = Get.find();

  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    homeController.fetchCase();
    homeController.fetchPerson();
    homeController.fetchBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      sizeController.width(MediaQuery.of(context).size.width);
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ///下方頁面
              bottom(),

              ///上方欄位
              top(),
            ],
          ),
        ),
      );
    });
  }

  Widget top() {
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
                        onTap: () {},
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
                  const SizedBox(height: 13),
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

  Widget bottom() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          height: sizeController.width > 600 ? 90 : 150,
          width: double.maxFinite,
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
                text: '活動',
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
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (var element in homeController.caseList)
                CaseCard(
                  model: element,
                )
            ],
          ),
        ),
        homePageBlock(
            title: '找夥伴',
            status: homeController.loadingStatusPerson.value,
            child: Wrap(
              children: [
                for (var element in homeController.personList)
                  PersonCard(
                    model: element,
                  )
              ],
            )),
        homePageBlock(
          title: '找活動',
          status: LoadingStatus.finish,
          child: const SizedBox(),
        ),
      ],
    );
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
