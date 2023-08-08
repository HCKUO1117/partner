import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:partner/controllers/user_controller.dart';

import '../../constants.dart';
import '../../utils/translation.dart';
import '../../widgets/editable_text_title.dart';

class AddExperienceDialog extends StatefulWidget {
  final int? index;

  const AddExperienceDialog({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<AddExperienceDialog> createState() => _AddExperienceDialogState();
}

class _AddExperienceDialogState extends State<AddExperienceDialog> {
  TextEditingController controller = TextEditingController();
  UserController userController = Get.find();

  String? error;

  @override
  void initState() {
    if (widget.index != null) {
      controller.text = userController.userResume.value?.experiences[widget.index!] ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: Constants.secondChangeWidth),
              width: double.maxFinite,
            ),
            EditableTextTitle(
              title: Messages.experiences.tr,
              controller: controller,
              editTextType: EditTextType.editable,
              error: error,
              onChange: (v) {
                setState(() {
                  error = null;
                });
              },
            )
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
              await userController.modifyExperience(
                index: widget.index!,
                content: controller.text,
              );
            } else {
              await userController.addExperience(controller.text);
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
