import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;

class Utils {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static int listLengthCounter({
    required int listLength,
    required int maxLength,
  }) {
    if (maxLength > listLength) {
      return listLength;
    }
    return maxLength;
  }

  static Future<void> delay({int? second}) async {
    await Future.delayed(Duration(seconds: second ?? 1));
  }

  static Future<XFile?> pickSingleImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static Future<List<XFile>> pickMultiImage() async {
    final ImagePicker picker = ImagePicker();

    final List<XFile> images = await picker.pickMultiImage();
    return images;
  }

  static String? handleImageUpload() {
    final html.FileUploadInputElement input = html.FileUploadInputElement()..accept = 'image/*';
    String? selectedImagePath;
    input.click();
    final List<html.File> files = input.files!;
    print(files);
    if (files.isNotEmpty) {
      final html.FileReader reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        if (reader.result != null) {

            selectedImagePath = reader.result as String;

        }
      });

      reader.readAsDataUrl(files[0]);
    }
  }
}
