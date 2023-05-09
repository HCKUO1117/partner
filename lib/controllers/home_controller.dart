import 'package:get/get.dart';
import 'package:partner/models/banner_model.dart';
import 'package:partner/models/case_model.dart';
import 'package:partner/models/loading_status.dart';
import 'package:partner/models/person_model.dart';
import 'package:partner/models/tag_model.dart';

class HomeController extends GetxController {
  ///banner
  var loadingStatusBanner = LoadingStatus.finish.obs;
  var banners = <BannerModel>[].obs;

  ///需求
  var loadingStatusCase = LoadingStatus.finish.obs;
  var caseList = <CaseModel>[].obs;

  ///人才
  var loadingStatusPerson = LoadingStatus.finish.obs;
  var personList = <PersonModel>[].obs;

  Future<void> fetchCase() async {
    loadingStatusCase(LoadingStatus.loading);
    update();
    await Future.delayed(Duration(seconds: 1), () {
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
