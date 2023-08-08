import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/models/tag_model.dart';
import 'package:partner/utils/translation.dart';
import 'package:select2dot1/select2dot1.dart';

import 'custom_select2dot1.dart';

class ChooseTagTitle extends StatelessWidget {
  final List<TagModel> tags;

  ChooseTagTitle({
    Key? key,
    required this.tags,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Messages.tag.tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        Text(
          Messages.tagLimit.tr,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        CustomExample2(
        ),
      ],
    );
  }
}

class CustomExample2 extends StatelessWidget {

  const CustomExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomSelect2dot1(
        title: 'Example 2',
        data: [
          SingleCategoryModel(
            singleItemCategoryList: [
              SingleItemCategoryModel(nameSingleItem: 'Alabama'),
              SingleItemCategoryModel(nameSingleItem: 'Arkansas'),
              SingleItemCategoryModel(nameSingleItem: 'Illonois'),
              SingleItemCategoryModel(nameSingleItem: 'Iowa'),
              SingleItemCategoryModel(nameSingleItem: 'Kansas'),
              SingleItemCategoryModel(nameSingleItem: 'Kentucky'),
              SingleItemCategoryModel(nameSingleItem: 'Louisiana'),
              SingleItemCategoryModel(nameSingleItem: 'Minnesota'),
              SingleItemCategoryModel(nameSingleItem: 'Mississippi'),
              SingleItemCategoryModel(nameSingleItem: 'Missouri'),
              SingleItemCategoryModel(nameSingleItem: 'Oklahoma'),
              SingleItemCategoryModel(nameSingleItem: 'South Dakota'),
              SingleItemCategoryModel(nameSingleItem: 'Texas'),
              SingleItemCategoryModel(nameSingleItem: 'Tennessee'),
            ],
          ),
        ],
        isMultiSelect: true,
        avatarInSingleSelect: false,
        extraInfoInSingleSelect: true,
        extraInfoInDropdown: true,
      ),
    );
  }
}
