import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';
import '../../controllers/user_controller.dart';
import '../../models/user_model.dart';
import '../../utils/translation.dart';
import '../../utils/utils.dart';
import '../../widgets/editable_text_title.dart';
import '../../widgets/image_widget.dart';

class AccountInformationLayout extends StatelessWidget {
  AccountInformationLayout({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = userController.userModel.value;
    return Obx(
      () => Card(
        elevation: 0,
        child: Column(
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
        ),
      ),
    );
  }
}
