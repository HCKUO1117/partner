import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/models/user_model.dart';
import 'package:partner/screens/account/account_page.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/preferences.dart';
import 'package:partner/utils/utils.dart';

class UserController extends GetxController {
  bool get isLogin => Preferences.getString(Constants.token, '').isNotEmpty;

  var infoState = LoadingState.finished.obs;
  var resumeState = LoadingState.finished.obs;
  var articleState = LoadingState.finished.obs;
  var recruitState = LoadingState.finished.obs;
  var inviteState = LoadingState.finished.obs;

  var infoDone = false;
  var resumeDone = false;
  var articleDone = false;
  var recruitDone = false;
  var inviteDone = false;

  // List<String> schedule = [];

  ///userModel
  var userModel = UserModel(id: 0, nickName: '', profile: '', email: '').obs;

  Future<void> fetch(AccountPagePath path) async {
    // schedule.add(path.path);

    switch (path) {
      case AccountPagePath.info:
        if (infoDone || infoState.value == LoadingState.loading) return;
        infoState(LoadingState.loading);
        await Utils.delay();
        //TODO user資料
        userModel(UserModel.sample());

        infoState(LoadingState.finished);
        infoDone = true;
        // schedule.removeAt(schedule.indexWhere((element) => element == path.path));
        // if (!schedule.contains(path.path)) {
        //   infoState(LoadingState.finished);
        //   infoDone = true;
        // }

        break;
      case AccountPagePath.resume:
        if (resumeDone || resumeState.value == LoadingState.loading) return;
        resumeState(LoadingState.loading);
        await Utils.delay();

        resumeState(LoadingState.finished);
        resumeDone = true;
        // schedule.removeAt(schedule.indexWhere((element) => element == path.path));
        // if (!schedule.contains(path.path)) {
        //   resumeState(LoadingState.finished);
        //   resumeDone = true;
        // }
        break;
      case AccountPagePath.article:
        if (articleDone || articleState.value == LoadingState.loading) return;
        articleState(LoadingState.loading);
        await Utils.delay();

        articleState(LoadingState.finished);
        articleDone = true;
        // schedule.removeAt(schedule.indexWhere((element) => element == path.path));
        // if (!schedule.contains(path.path)) {
        //   articleState(LoadingState.finished);
        //   articleDone = true;
        // }
        break;
      case AccountPagePath.myRecruit:
        if (recruitDone || recruitState.value == LoadingState.loading) return;
        recruitState(LoadingState.loading);
        await Utils.delay();

        recruitState(LoadingState.finished);
        recruitDone = true;
        // schedule.removeAt(schedule.indexWhere((element) => element == path.path));
        // if (!schedule.contains(path.path)) {
        //   recruitState(LoadingState.finished);
        //   recruitDone = true;
        // }
        break;
      case AccountPagePath.invite:
        if (inviteDone || inviteState.value == LoadingState.loading) return;
        inviteState(LoadingState.loading);
        await Utils.delay();

        inviteState(LoadingState.finished);
        inviteDone = true;
        // schedule.removeAt(schedule.indexWhere((element) => element == path.path));
        // if (!schedule.contains(path.path)) {
        //   inviteState(LoadingState.finished);
        //   inviteDone = true;
        // }
        break;
    }
  }

  LoadingState checkIsLoading(AccountPagePath path) {
    switch (path) {
      case AccountPagePath.info:
        return infoState.value;
      case AccountPagePath.resume:
        return resumeState.value;
      case AccountPagePath.article:
        return articleState.value;
      case AccountPagePath.myRecruit:
        return recruitState.value;
      case AccountPagePath.invite:
        return inviteState.value;
    }
  }
}