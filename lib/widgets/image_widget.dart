import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double radius;

  const ImageWidget(
      {Key? key,
      required this.url,
      this.fit = BoxFit.cover,
      this.width,
      this.height,
      this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: width,
        height: height,
        progressIndicatorBuilder: (_, __, ___) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
