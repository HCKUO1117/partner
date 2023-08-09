import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/models/banner_model.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/widgets/image_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BannerWidget extends StatefulWidget {
  final LoadingState state;
  final List<BannerModel> banners;

  const BannerWidget({
    Key? key,
    required this.state,
    required this.banners,
  }) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final _current = 0.obs;

  @override
  Widget build(BuildContext context) {
    return LoadingLayout(
      state: widget.state,
      fixedSize: 400,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                carouselController.previousPage();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Constants.primaryOrange,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  CarouselSlider(
                    items: widget.banners
                        .map(
                          (e) => InkWell(
                            onTap: () {
                              launchUrlString(e.url);
                            },
                            child: ImageWidget(
                              url: e.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.5,
                      onPageChanged: (index, reason) {
                        _current(index);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.banners.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () {
                            carouselController.animateToPage(entry.key);
                          },
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.primaryOrange
                                  .withOpacity(_current.value == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                carouselController.nextPage();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Constants.primaryOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
