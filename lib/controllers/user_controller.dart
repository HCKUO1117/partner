import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partner/constants.dart';
import 'package:partner/models/article_model.dart';
import 'package:partner/models/resume_model.dart';
import 'package:partner/models/user_model.dart';
import 'package:partner/screens/account/account_page.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/preferences.dart';
import 'package:partner/utils/translation.dart';
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

  ///userModel
  Rx<UserModel?> userModel = Rx(null);

  TextEditingController userEmail = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController contactEmail = TextEditingController();
  Rx<GenderType?> selectedGenderType = Rx(null);
  Rx<XFile?> changedProfile = Rx(null);

  var canUserSave = false.obs;

  void onCanUserSaveListen() {
    canUserSave(userModel.value != null &&
        (nickname.value.text != userModel.value?.nickName ||
            selectedGenderType.value != userModel.value?.genderType ||
            changedProfile.value != null) &&
        nickname.value.text.isNotEmpty);
  }

  ///userResume
  Rx<ResumeModel?> userResume = Rx(null);
  TextEditingController shortIntro = TextEditingController();
  TextEditingController completeIntro = TextEditingController();

  var canResumeSave = false.obs;

  void onCanResumeSaveListen() {
    canResumeSave(
      userResume.value != null &&
          (shortIntro.text != userResume.value?.shortIntro ||
              completeIntro.text != userResume.value?.completeIntro),
    );
  }

  Future<void> addExperience(String content) async {
    //TODO 新增經驗
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.experiences.add(content);
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> modifyExperience({
    required int index,
    required String content,
  }) async {
    //TODO 修改經驗
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.experiences[index] = content;
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> deleteExperience(int index) async {
    //TODO 刪除經驗
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.experiences.removeAt(index);
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> addExpertise(SkillModel model) async {
    //TODO 新增專長
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.skillList.add(model);
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> modifyExpertise({
    required int index,
    required SkillModel model,
  }) async {
    //TODO 修改專長
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.skillList[index] = model;
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> deleteExpertise(int index) async {
    //TODO 刪除專長
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.skillList.removeAt(index);
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> addPortFolio(PortfolioModel model) async {
    //TODO 新增作品
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.portfolioList.add(model);
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> modifyPortfolio({
    required int index,
    required PortfolioModel model,
  }) async {
    //TODO 修改作品
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.portfolioList[index] = model;
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> deletePortfolio(int index) async {
    //TODO 刪除作品
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.portfolioList.removeAt(index);
    userResume.refresh();

    SmartDialog.dismiss();
  }

  Future<void> setResumeOpen(bool open) async {
    //TODO 設定履歷開啟
    SmartDialog.showLoading(msg: Messages.loading.tr);
    await Utils.delay();
    userResume.value?.open = open;
    userResume.refresh();

    SmartDialog.dismiss();
  }

  ///文章


  ///
  Future<void> fetch(AccountPagePath path) async {
    switch (path) {
      case AccountPagePath.info:
        if (infoDone || infoState.value == LoadingState.loading) return;
        infoState(LoadingState.loading);
        await Utils.delay();
        //TODO user資料
        userModel(UserModel.sample());
        userEmail.text = userModel.value?.email ?? '';
        nickname.text = userModel.value?.nickName ?? '';
        phone.text = userModel.value?.phone ?? '';
        contactEmail.text = userModel.value?.contactEmail ?? '';
        selectedGenderType(userModel.value?.genderType);

        infoState(LoadingState.finished);
        infoDone = true;

        break;
      case AccountPagePath.resume:
        if (resumeDone || resumeState.value == LoadingState.loading) return;
        resumeState(LoadingState.loading);
        await Utils.delay();
        //TODO 履歷資料
        userResume(ResumeModel.sample());
        shortIntro.text = userResume.value?.shortIntro ?? '';
        completeIntro.text = userResume.value?.completeIntro ?? '';

        resumeState(LoadingState.finished);
        resumeDone = true;

        break;
      case AccountPagePath.article:
        if (articleDone || articleState.value == LoadingState.loading) return;
        articleState(LoadingState.loading);
        await Utils.delay();

        articleState(LoadingState.finished);
        articleDone = true;

        break;
      case AccountPagePath.myRecruit:
        if (recruitDone || recruitState.value == LoadingState.loading) return;
        recruitState(LoadingState.loading);
        await Utils.delay();

        recruitState(LoadingState.finished);
        recruitDone = true;

        break;
      case AccountPagePath.invite:
        if (inviteDone || inviteState.value == LoadingState.loading) return;
        inviteState(LoadingState.loading);
        await Utils.delay();

        inviteState(LoadingState.finished);
        inviteDone = true;

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
