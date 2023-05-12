import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/models/banner_model.dart';
import 'package:partner/models/case_model.dart';
import 'package:partner/models/loading_status.dart';
import 'package:partner/models/person_model.dart';
import 'package:partner/models/tag_category_model.dart';
import 'package:partner/models/tag_model.dart';

class HomeController extends GetxController {
  var tagCategories = <TagCategoryModel>[].obs;

  TextEditingController search = TextEditingController();

  ///banner
  var loadingStatusBanner = LoadingStatus.finish.obs;
  var banners = <BannerModel>[].obs;

  ///需求
  var loadingStatusCase = LoadingStatus.finish.obs;
  var caseList = <CaseModel>[].obs;
  Rx<int?> caseCurrentTag = Rx(null);

  ///人才
  var loadingStatusPerson = LoadingStatus.finish.obs;
  var personList = <PersonModel>[].obs;
  Rx<int?> personCurrentTag = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();
    loadingStatusCase(LoadingStatus.loading);
    loadingStatusPerson(LoadingStatus.loading);
    await fetchTagCategory();

    update();
    await Future.wait([
      fetchBanner(),
      fetchPerson(),
      fetchCase(),
    ]);
  }

  Future<void> fetchTagCategory() async {
    //TODO 假資料
    tagCategories([
      TagCategoryModel(id: 0, name: '123'),
      TagCategoryModel(id: 1, name: '3123'),
      TagCategoryModel(id: 2, name: '144323'),
      TagCategoryModel(id: 3, name: '213'),
      TagCategoryModel(id: 4, name: '12'),
      TagCategoryModel(id: 5, name: '12'),
      TagCategoryModel(id: 6, name: '12'),
      TagCategoryModel(id: 7, name: '12'),
      TagCategoryModel(id: 8, name: '12'),
    ]);
    if (tagCategories.isNotEmpty) {
      caseCurrentTag(tagCategories.first.id);
      personCurrentTag(tagCategories.first.id);
      update();
    }
  }

  Future<void> fetchCase() async {
    loadingStatusCase(LoadingStatus.loading);
    update();
    await Future.delayed(Duration(seconds: 1), () {
      //TODO 假資料
      caseList([
        CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
        ),
        CaseModel(
          title: 'title',
          content: 'content',
          tags: [
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
          ],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
        ),
        CaseModel(
          title: 'title',
          content: 'content',
          tags: [],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
        ),
        CaseModel(
          title: 'title',
          content: 'content',
          tags: [],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
        ),
        CaseModel(
          title: 'title',
          content: 'content',
          tags: [],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
        ),
        CaseModel(
          title: 'title',
          content: 'content',
          tags: [],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
        ),
      ]);
    });

    loadingStatusCase(LoadingStatus.finish);
    update();
  }

  Future<void> fetchBanner() async {
    loadingStatusBanner(LoadingStatus.loading);
    update();
    await Future.delayed(Duration(seconds: 1), () {
      //TODO 假資料
      banners([
        BannerModel(
          url:
              'https://images.pexels.com/photos/258109/pexels-photo-258109.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          image:
              'https://images.pexels.com/photos/258109/pexels-photo-258109.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        BannerModel(
          url:
              'https://images.pexels.com/photos/2286895/pexels-photo-2286895.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          image:
              'https://images.pexels.com/photos/2286895/pexels-photo-2286895.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        )
      ]);
    });

    loadingStatusBanner(LoadingStatus.finish);
    update();
  }

  Future<void> fetchPerson() async {
    loadingStatusPerson(LoadingStatus.loading);
    update();
    await Future.delayed(Duration(seconds: 2), () {
      //TODO 假資料
      personList([
        PersonModel(
          id: 'id',
          name: 'name',
          image: 'image',
          intro: 'intro',
          tags: [
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
          ],
        ),
        PersonModel(
          id: 'id',
          name: 'name',
          image: 'image',
          intro: 'intro',
          tags: [
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
          ],
        ),
        PersonModel(
          id: 'id',
          name: 'name',
          image: 'image',
          intro: 'intro',
          tags: [
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
          ],
        ),
        PersonModel(
          id: 'id',
          name: 'name',
          image: 'image',
          intro: 'intro',
          tags: [
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
          ],
        ),
        PersonModel(
          id: 'id',
          name: 'name',
          image: 'image',
          intro: 'intro',
          tags: [
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
            TagModel(id: '1', name: 'name'),
          ],
        ),
      ]);
    });

    loadingStatusPerson(LoadingStatus.finish);
    update();
  }
}
