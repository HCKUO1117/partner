import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partner/constants.dart';
import 'package:partner/utils/utils.dart';
import 'package:partner/widgets/image_widget.dart';

import '../../utils/translation.dart';
import '../../widgets/editable_text_title.dart';

class AddExpertiseDialog extends StatefulWidget {
  const AddExpertiseDialog({Key? key}) : super(key: key);

  @override
  State<AddExpertiseDialog> createState() => _AddExpertiseDialogState();
}

class _AddExpertiseDialogState extends State<AddExpertiseDialog> {
  TextEditingController controller = TextEditingController();
  TextEditingController illustrate = TextEditingController();

  List<XFile> images = [];

  String? error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditableTextTitle(
              title: Messages.expertises.tr,
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
            Text(
              Messages.portfolio.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            Text(
              Messages.portfolioHint.tr,
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var element in images)
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ImageWidget(
                            url: element.path,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                images.remove(element);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 16,
                              height: 16,
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (images.length < 5)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () async {
                          List<XFile> temp = await Utils.pickMultiImage();
                          if (temp.length <= 5 - images.length) {
                            setState(() {
                              images.addAll(temp);
                            });
                          } else {
                            SmartDialog.showNotify(
                              msg: Messages.moreThan5.tr,
                              notifyType: NotifyType.warning,
                            );
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.black12,
                          child: Icon(
                            Icons.add,
                            color: Constants.primaryOrange,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            EditableTextTitle(
              title: Messages.illustrate.tr,
              hint: Messages.illustrateHint.tr,
              controller: illustrate,
              editTextType: EditTextType.editable,
              onChange: (v) {},
            ),
            const SizedBox(height: 8),
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
          onPressed: () {
            if (controller.text.isEmpty) {
              setState(() {
                error = Messages.canNotEmpty.tr;
              });
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add),
              Text(Messages.add.tr),
            ],
          ),
        ),
      ],
    );
  }
}
