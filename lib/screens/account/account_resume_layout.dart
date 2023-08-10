import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:partner/widgets/portfolio_card.dart';

import '../../constants.dart';
import '../../controllers/user_controller.dart';
import '../../utils/translation.dart';
import '../../widgets/editable_text_title.dart';
import '../../widgets/experience_card.dart';
import '../../widgets/expertise_card.dart';
import '../../widgets/image_widget.dart';
import 'add_experience_dialog.dart';
import 'add_expertise_dialog.dart';
import 'add_portfolio_dialog.dart';

class AccountResumeLayout extends StatelessWidget {
  AccountResumeLayout({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    var resume = userController.userResume.value;
    return Obx(
      () => Column(
        children: [
          Card(
            elevation: 0,
            child: Padding(
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
            ),
          ),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 16),
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
                            onPressed: () async {
                              bool? result = await SmartDialog.show(
                                builder: (context) => const AddExperienceDialog(),
                              );

                              if (result ?? false) {
                                SmartDialog.showNotify(
                                  msg: Messages.addSuccess.tr,
                                  notifyType: NotifyType.success,
                                );
                              }
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
                      const Divider(),
                      if (userController.userResume.value == null ||
                          userController.userResume.value!.experiences.isEmpty)
                        Text(
                          Messages.noData.tr,
                          style: const TextStyle(color: Colors.black54),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: userController.userResume.value!.experiences.length,
                          itemBuilder: (context, index) {
                            return ExperienceCard(
                              content: userController.userResume.value!.experiences[index],
                              onEdit: () async {
                                bool? result = await SmartDialog.show(
                                  builder: (context) => AddExperienceDialog(
                                    index: index,
                                  ),
                                );

                                if (result ?? false) {
                                  SmartDialog.showNotify(
                                    msg: Messages.modifySuccess.tr,
                                    notifyType: NotifyType.success,
                                  );
                                }
                              },
                              onDelete: () {
                                SmartDialog.show(
                                  builder: (context) => AlertDialog(
                                    title: Text(Messages.delete.tr),
                                    content: Text(Messages.checkDelete.tr),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          SmartDialog.dismiss();
                                        },
                                        child: Text(
                                          Messages.cancel.tr,
                                          style: const TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await userController.deleteExperience(index);
                                          SmartDialog.dismiss();
                                          SmartDialog.showNotify(
                                            msg: Messages.deleteSuccess.tr,
                                            notifyType: NotifyType.success,
                                          );
                                        },
                                        child: Text(Messages.confirm.tr),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
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
                                builder: (context) => const AddExpertiseDialog(),
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
                      const Divider(),
                      if (userController.userResume.value == null ||
                          userController.userResume.value!.skillList.isEmpty)
                        Text(
                          Messages.noData.tr,
                          style: const TextStyle(color: Colors.black54),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: userController.userResume.value!.skillList.length,
                          itemBuilder: (context, index) {
                            return ExpertiseCard(
                              name: userController.userResume.value!.skillList[index].name,
                              content:
                                  userController.userResume.value!.skillList[index].description,
                              onEdit: () async {
                                bool? result = await SmartDialog.show(
                                  builder: (context) => AddExpertiseDialog(
                                    index: index,
                                  ),
                                );

                                if (result ?? false) {
                                  SmartDialog.showNotify(
                                    msg: Messages.modifySuccess.tr,
                                    notifyType: NotifyType.success,
                                  );
                                }
                              },
                              onDelete: () {
                                SmartDialog.show(
                                  builder: (context) => AlertDialog(
                                    title: Text(Messages.delete.tr),
                                    content: Text(Messages.checkDelete.tr),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          SmartDialog.dismiss();
                                        },
                                        child: Text(
                                          Messages.cancel.tr,
                                          style: const TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await userController.deleteExpertise(index);
                                          SmartDialog.dismiss();
                                          SmartDialog.showNotify(
                                            msg: Messages.deleteSuccess.tr,
                                            notifyType: NotifyType.success,
                                          );
                                        },
                                        child: Text(Messages.confirm.tr),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              Messages.portfolio.tr,
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
                                builder: (context) => const AddPortfolioDialog(),
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
                      const Divider(),
                      if (userController.userResume.value == null ||
                          userController.userResume.value!.portfolioList.isEmpty)
                        Text(
                          Messages.noData.tr,
                          style: const TextStyle(color: Colors.black54),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: userController.userResume.value!.portfolioList.length,
                          itemBuilder: (context, index) {
                            return PortfolioCard(
                              name: userController.userResume.value!.portfolioList[index].name,
                              content:
                                  userController.userResume.value!.portfolioList[index].description,
                              images: userController.userResume.value!.portfolioList[index].images,
                              link:
                                  userController.userResume.value!.portfolioList[index].link ?? '',
                              onEdit: () async {
                                bool? result = await SmartDialog.show(
                                  builder: (context) => AddPortfolioDialog(
                                    index: index,
                                  ),
                                );

                                if (result ?? false) {
                                  SmartDialog.showNotify(
                                    msg: Messages.modifySuccess.tr,
                                    notifyType: NotifyType.success,
                                  );
                                }
                              },
                              onDelete: () {
                                SmartDialog.show(
                                  builder: (context) => AlertDialog(
                                    title: Text(Messages.delete.tr),
                                    content: Text(Messages.checkDelete.tr),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          SmartDialog.dismiss();
                                        },
                                        child: Text(
                                          Messages.cancel.tr,
                                          style: const TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await userController.deletePortfolio(index);
                                          SmartDialog.dismiss();
                                          SmartDialog.showNotify(
                                            msg: Messages.deleteSuccess.tr,
                                            notifyType: NotifyType.success,
                                          );
                                        },
                                        child: Text(Messages.confirm.tr),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            Messages.resumeOpen.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Text(userController.userResume.value?.open ?? false
                              ? Messages.open.tr
                              : Messages.close.tr),
                          Switch(
                            value: userController.userResume.value?.open ?? false,
                            onChanged: (v) async {
                              await userController.setResumeOpen(v);
                              SmartDialog.showNotify(
                                msg: Messages.modifySuccess.tr,
                                notifyType: NotifyType.success,
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
