import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/models/user_model.dart';
import 'package:partner/navigator_v2/router_delegate.dart';
import 'package:partner/screens/common/layout_with_topper_page.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/translation.dart';
import 'package:partner/widgets/editable_text_title.dart';
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

  final TextEditingController userEmail = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController contactEmail = TextEditingController();

  Widget _content(BuildContext context) {
    UserModel userModel = userController.userModel.value;
    userEmail.text = userModel.email;
    name.text = userModel.nickName;
    phone.text = userModel.phone ?? '';
    contactEmail.text = userModel.contactEmail ?? '';

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
                    child: _userCard(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userCard() {
    switch (path) {
      case AccountPagePath.info:
        return _info();
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
    return SizedBox();
  }

  Widget _info() {
    UserModel userModel = userController.userModel.value;
    return Column(
      children: [
        const SizedBox(height: 16),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: CachedNetworkImage(
                imageUrl: userModel.profile,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  onTap: () {},
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
                controller: userEmail,
                editTextType: EditTextType.none,
              ),
              const SizedBox(height: 32),
              EditableTextTitle(
                title: Messages.nickName.tr,
                controller: name,
                editTextType: EditTextType.editable,
              ),
              const SizedBox(height: 32),
              EditableTextTitle(
                title: Messages.phone.tr,
                controller: phone,
                hint: Messages.phoneHint.tr,
                editTextType: EditTextType.action,
                action: () {},
              ),
              const SizedBox(height: 32),
              EditableTextTitle(
                title: Messages.contactEmail.tr,
                controller: contactEmail,
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
              SizedBox(
                child: DropdownButtonFormField2<GenderType>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  hint: const Text(
                    'Select Your Gender',
                    style: TextStyle(fontSize: 14),
                  ),
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
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                  },
                  onSaved: (value) {
                    // selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
