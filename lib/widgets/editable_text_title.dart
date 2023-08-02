import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/constants.dart';
import 'package:partner/utils/translation.dart';

enum EditTextType {
  none,
  editable,
  action,
}

class EditableTextTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final EditTextType editTextType;
  final TextInputType? textInputType;
  final String? hint;
  final Function()? action;
  final Function(String)? onChange;
  final int? maxLength;
  final int? minLine;
  final String? error;

  const EditableTextTitle({
    Key? key,
    required this.title,
    required this.controller,
    required this.editTextType,
    this.textInputType,
    this.action,
    this.hint,
    this.onChange,
    this.maxLength,
    this.minLine,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        if (hint != null)
          Text(
            hint!,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 12,
            ),
          ),
        const SizedBox(height: 8),
        _textArea(),
      ],
    );
  }

  Widget _textArea() {
    switch (editTextType) {
      case EditTextType.none:
        return Text(
          controller.text,
        );
      case EditTextType.editable:
        return TextField(
          controller: controller,
          onChanged: onChange,
          maxLength: maxLength,
          maxLines: null,
          minLines: minLine,
          decoration: InputDecoration(
            errorText: error,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
            ),
          ),
        );
      case EditTextType.action:
        if (controller.text.isEmpty) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Constants.primaryOrange,
              foregroundColor: Colors.white,
            ),
            onPressed: action,
            child: Text(
              Messages.add.tr,
            ),
          );
        }
        return Row(
          children: [
            Expanded(
              child: Text(
                controller.text,
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: action,
              child: Text(
                Messages.change.tr,
                style: TextStyle(color: Constants.primaryOrange),
              ),
            ),
          ],
        );
    }
  }
}
