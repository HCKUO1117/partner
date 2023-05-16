import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/models/banner_model.dart';
import 'package:partner/models/case_model.dart';
import 'package:partner/models/loading_status.dart';
import 'package:partner/models/person_model.dart';
import 'package:partner/models/category_model.dart';
import 'package:partner/models/tag_model.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  TextEditingController search = TextEditingController();

  ///banner
  var loadingStatusBanner = LoadingStatus.finish.obs;
  var banners = <BannerModel>[].obs;

  ///需求
  var loadingStatusCase = LoadingStatus.finish.obs;
  var caseCategoryList = <CategoryModel>[].obs;
  Rx<int?> caseCurrentTag = Rx(null);
  TabController? caseTabController;

  ///人才
  var loadingStatusPerson = LoadingStatus.finish.obs;
  var personList = <PersonModel>[].obs;
  Rx<int?> personCurrentTag = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();

    await Future.wait([
      fetchBanner(),
      fetchPerson(),
      fetchCase(),
    ]);
  }


  Future<void> fetchCase() async {
    loadingStatusCase(LoadingStatus.loading);
    update();
    await Future.delayed(Duration(seconds: 1), () {
      //TODO 假資料
      caseCategoryList([
        CategoryModel(id: 0, name: '學習',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 1, name: '運動',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 2, name: '創業',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 3, name: '工作',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 4, name: '旅遊',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 5, name: '挑戰',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 6, name: '聊天',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 7, name: '娛樂',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 8, name: '美食',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 9, name: '競賽',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),
        CategoryModel(id: 10, name: '其他',cases: [ CaseModel(
          title: 'title',
          content: 'content',
          tags: [TagModel(id: '1', name: 'name')],
          images: [],
          location: 'location',
          createdTime: DateTime.now(),
          creatorId: '123',
          creatorName: '321',
          category: 0,
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
            category: 0,
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
            category: 0,
          ),],),

      ]);
    });
    caseCurrentTag(caseCategoryList.first.id);
    caseTabController = TabController(
      length: caseCategoryList.length,
      vsync: this,
    );
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
          intro: 'introintrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointrointro',
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
