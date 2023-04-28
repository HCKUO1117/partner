import 'package:get/get.dart';
import 'package:partner/models/case_model.dart';
import 'package:partner/models/loading_status.dart';
import 'package:partner/models/tag_model.dart';

class HomeController extends GetxController {
  ///需求
  var loadingStatus = LoadingStatus.finish.obs;
  var caseList = <CaseModel>[].obs;

  var test = 'unchange'.obs;

  Future<void> change() async {
    await Future.delayed(Duration(seconds: 3));
    test('changed');
    update();
  }

  Future<void> fetchCase() async {
    loadingStatus(LoadingStatus.loading);
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

    loadingStatus(LoadingStatus.finish);
    update();
  }
}
