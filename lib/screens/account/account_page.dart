import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/models/user_model.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/screens/common/layout_with_topper_page.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/translation.dart';
import 'package:partner/utils/utils.dart';
import 'package:partner/widgets/editable_text_title.dart';
import 'package:partner/widgets/image_widget.dart';
import 'package:partner/widgets/list_button.dart';

enum AccountPagePath {
  info,
  resume,
  article,
  myRecruit,
  invite,
}

extension AccountPagePathEx on AccountPagePath {
  String get path {
    switch (this) {
      case AccountPagePath.info:
        return Constants.accountInfoRoute;
      case AccountPagePath.resume:
        return Constants.accountResumeRoute;
      case AccountPagePath.article:
        return Constants.accountArticleRoute;
      case AccountPagePath.myRecruit:
        return Constants.accountMyRecruitRoute;
      case AccountPagePath.invite:
        return Constants.accountInviteRoute;
    }
  }

  String get name {
    switch (this) {
      case AccountPagePath.info:
        return Messages.memberInfo.tr;
      case AccountPagePath.resume:
        return Messages.myResume.tr;
      case AccountPagePath.article:
        return Messages.myArticles.tr;
      case AccountPagePath.myRecruit:
        return Messages.myRecruits.tr;
      case AccountPagePath.invite:
        return Messages.invites.tr;
    }
  }
}

class AccountPage extends StatelessWidget {
  final AccountPagePath path;

  AccountPage({
    Key? key,
    required this.path,
  }) : super(key: key);

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutWithTopperPage(bottom: _content(context));
  }

  Widget _content(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: Constants.maxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: IntrinsicWidth(
                child: Column(
                  children: [
                    for (var element in AccountPagePath.values)
                      ListButton(
                        title: element.name,
                        selected: path.path == element.path,
                        onTap: () {
                          AppRouterDelegate.of(context).pushNamed(element.path);
                        },
                      )
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: LoadingLayout(
                  fixedSize: 500,
                  state: userController.checkIsLoading(path),
                  child: Card(
                    child: _userCard(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userCard(BuildContext context) {
    switch (path) {
      case AccountPagePath.info:
        return _info();
      case AccountPagePath.resume:
        return _resume(context);
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
    return SizedBox();
  }

  Widget _info() {
    UserModel? userModel = userController.userModel.value;
    return Column(
      children: [
        const SizedBox(height: 16),
        Stack(
          children: [
            ImageWidget(
              url: userController.changedProfile.value == null
                  ? userModel?.profile ?? ''
                  : userController.changedProfile.value?.path ?? '',
              fit: BoxFit.cover,
              width: 200,
              height: 200,
              radius: 200,
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  onTap: () async {
                    XFile? file = await Utils.pickSingleImage();
                    if (file != null) {
                      userController.changedProfile(file);
                      userController.onCanUserSaveListen();
                    }
                  },
                  customBorder: const CircleBorder(),
                  child: Container(
                    color: Constants.primaryOrange,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              EditableTextTitle(
                title: 'E-mail/${Messages.account.tr}',
                controller: userController.userEmail,
                editTextType: EditTextType.none,
              ),
              const SizedBox(height: 32),
              EditableTextTitle(
                title: Messages.nickName.tr,
                controller: userController.nickname,
                maxLength: 50,
                editTextType: EditTextType.editable,
                onChange: (v) {
                  userController.onCanUserSaveListen();
                },
              ),
              const SizedBox(height: 32),
              EditableTextTitle(
                title: Messages.phone.tr,
                controller: userController.phone,
                hint: Messages.phoneHint.tr,
                editTextType: EditTextType.action,
                action: () {},
              ),
              const SizedBox(height: 32),
              EditableTextTitle(
                title: Messages.contactEmail.tr,
                controller: userController.contactEmail,
                hint: Messages.contactEmailHint.tr,
                editTextType: EditTextType.action,
                action: () {},
              ),
              const SizedBox(height: 32),
              Text(
                Messages.gender.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  DropdownButton2<GenderType?>(
                    value: userController.selectedGenderType.value,
                    hint: Text(
                      Messages.selectYourGender.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                    ),
                    buttonStyleData: ButtonStyleData(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    underline: const SizedBox(),
                    items: GenderType.values
                        .map(
                          (item) => DropdownMenuItem<GenderType>(
                            value: item,
                            child: Text(
                              item.text,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      userController.selectedGenderType(value);
                      userController.onCanUserSaveListen();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: userController.canUserSave.value ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.primaryOrange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.all(14),
                    ),
                    child: Text(
                      Messages.save.tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  Widget _resume(BuildContext context) {
    var resume = userController.userResume.value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              ImageWidget(
                url: resume?.profile ?? '',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                radius: 100,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  resume?.nickname ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 32),
          EditableTextTitle(
            title: Messages.shortIntro.tr,
            controller: userController.shortIntro,
            editTextType: EditTextType.editable,
            maxLength: 300,
            onChange: (v) {
              userController.onCanResumeSaveListen();
            },
          ),
          const SizedBox(height: 32),
          EditableTextTitle(
            title: Messages.completeIntro.tr,
            controller: userController.completeIntro,
            editTextType: EditTextType.editable,
            maxLength: 1000,
            minLine: 10,
            onChange: (v) {
              userController.onCanResumeSaveListen();
            },
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      Messages.experiences.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      SmartDialog.show(
                        builder: (context) => AlertDialog(
                          title:Text('123123') ,
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.add),
                        Text(Messages.add.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      Messages.expertises.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      SmartDialog.show(
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      SmartDialog.dismiss();
                                    },
                                    icon: const Icon(Icons.clear),
                                  ),
                                ],
                              ),
                              EditableTextTitle(
                                title: Messages.expertises.tr,
                                controller: userController.completeIntro,
                                editTextType: EditTextType.editable,
                                maxLength: 1000,
                                minLine: 10,
                                onChange: (v) {
                                  userController.onCanResumeSaveListen();
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.add),
                        Text(Messages.add.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: userController.canResumeSave.value ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryOrange,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.all(14),
                ),
                child: Text(
                  Messages.save.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
