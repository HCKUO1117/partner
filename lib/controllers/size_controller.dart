import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeController extends GetxController {
  var width = 0.0.obs;
  var height = 0.0.obs;

  @override
  void onInit() {
    window.onResize.listen((event) {
      updateSize(Get.size);
    });
    super.onInit();
  }

  void updateSize(Size size){
    width(size.width);
    height(size.height);
    update();
  }
}