import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/utils/preferences.dart';

class UserController extends GetxController{
  
  bool get isLogin => Preferences.getString(Constants.token, '').isNotEmpty;

}