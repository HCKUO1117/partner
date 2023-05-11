import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class VerticalAdWidget extends StatelessWidget {
  const VerticalAdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100.0,
      width: 320.0,
      child: HtmlElementView(
        viewType: 'adViewType',
      ),
    );
  }
}
