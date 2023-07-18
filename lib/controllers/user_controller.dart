import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/screens/account/account_page.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/preferences.dart';
import 'package:partner/utils/utils.dart';

class UserController extends GetxController{
  
  bool get isLogin => Preferences.getString(Constants.token, '').isNotEmpty;

  var accountPageState = LoadingState.finished.obs;

  Future<void> fetch(AccountPagePath path)async {
    accountPageState(LoadingState.loading);
    await Utils.delay();
    switch(path){
      case AccountPagePath.info:
        // TODO: Handle this case.
        break;
      case AccountPagePath.resume:
        // TODO: Handle this case.
        break;
      case AccountPagePath.article:
        // TODO: Handle this case.
        break;
      case AccountPagePath.myRecruit:
        // TODO: Handle this case.
        break;
      case AccountPagePath.invite:
        // TODO: Handle this case.
        break;
    }

    accountPageState(LoadingState.finished);
  }

}