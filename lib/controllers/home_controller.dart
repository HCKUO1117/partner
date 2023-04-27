import 'package:get/get.dart';

class HomeController extends GetxController{

  var test = 'unchange'.obs;

  Future<void> change() async {
    await Future.delayed(Duration(seconds: 3));
    test('changed');
    update();
  }

}