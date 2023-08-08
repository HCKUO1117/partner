import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/models/resume_model.dart';

import '../../controllers/user_controller.dart';
import '../../utils/translation.dart';
import '../../widgets/editable_text_title.dart';

class AddExpertiseDialog extends StatefulWidget {
  final int? index;

  const AddExpertiseDialog({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<AddExpertiseDialog> createState() => _AddPortfolioDialogState();
}

class _AddPortfolioDialogState extends State<AddExpertiseDialog> {
  TextEditingController controller = TextEditingController();
  TextEditingController description = TextEditingController();

  String? error;

  UserController userController = Get.find();

  @override
  void initState() {
    if (widget.index != null) {
      controller.text = userController.userResume.value?.skillList[widget.index!].name ?? '';
      description.text =
          userController.userResume.value?.skillList[widget.index!].description ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: Constants.secondChangeWidth),
              width: double.maxFinite,
            ),
            EditableTextTitle(
              title: Messages.name.tr,
              controller: controller,
              editTextType: EditTextType.editable,
              error: error,
              onChange: (v) {
                setState(() {
                  error = null;
                });
              },
            ),
            const SizedBox(height: 8),
            EditableTextTitle(
              title: Messages.illustrate.tr,
              titleHint: Messages.illustrateHint.tr,
              controller: description,
              editTextType: EditTextType.editable,
              onChange: (v) {},
            ),
            const SizedBox(height: 8),
            // ChooseTagTitle(tags: [])
          ],
        ),
      ),
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
            if (controller.text.isEmpty) {
              setState(() {
                error = Messages.canNotEmpty.tr;
              });
              return;
            }
            if (widget.index != null) {
              await userController.modifyExpertise(
                index: widget.index!,
                model: SkillModel(
                  name: controller.text,
                  description: description.text,
                ),
              );
            } else {
              await userController.addExpertise(
                SkillModel(
                  name: controller.text,
                  description: description.text,
                ),
              );
            }

            SmartDialog.dismiss(result: true);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.index == null ? Icons.add : Icons.edit),
              Text(widget.index == null ? Messages.add.tr : Messages.modify.tr),
            ],
          ),
        ),
      ],
    );
  }
}
