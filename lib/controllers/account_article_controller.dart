import 'package:get/get.dart';
import 'package:partner/controllers/user_controller.dart';
import 'package:partner/screens/common/loading_layout.dart';
import 'package:partner/utils/utils.dart';

import '../models/article_model.dart';
import '../models/tag_model.dart';

class AccountArticleController extends GetxController {
  var articleState = LoadingState.finished.obs;
  var collectionState = LoadingState.finished.obs;

  final UserController userController = Get.find();

  var myArticles = <ArticleModel>[].obs;
  var myCollectArticles = <ArticleModel>[].obs;

  final selectedTabIndex = 0.obs;

  var articlePage = 1.obs;
  Rx<int?> articleTotalPage = Rx(null);

  var collectionPage = 1.obs;
  Rx<int?> collectionTotalPage = Rx(null);

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  Future<void> fetchArticle(int page) async {
    articleState(LoadingState.loading);
    await Utils.delay();
    articleTotalPage(6);
    myArticles([
      ArticleModel(
        id: 0,
        title: 'title',
        tags: [TagModel(id: '1', name: 'name')],
        createdTime: DateTime.now(),
        content: 'content',
        image:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        creatorId: 0,
        creatorName: 'creatorName',
        creatorImage:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        good: 10,
        viewed: 5602,
        isCollected: true,
      ),
      ArticleModel(
        id: 0,
        title: 'title',
        tags: [TagModel(id: '1', name: 'name')],
        createdTime: DateTime.now(),
        content: 'content',
        image:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        creatorId: 0,
        creatorName: 'creatorName',
        creatorImage:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        good: 10,
        viewed: 5602,
        isCollected: false,
      ),
      ArticleModel(
        id: 0,
        title: 'title',
        tags: [TagModel(id: '1', name: 'name')],
        createdTime: DateTime.now(),
        content: 'content',
        image:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        creatorId: 0,
        creatorName: 'creatorName',
        creatorImage:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        good: 10,
        viewed: 5602,
        isCollected: false,
      ),
    ]);
    articleState(LoadingState.finished);
  }

  Future<void> fetchCollection(int page) async {
    collectionState(LoadingState.loading);
    await Utils.delay();
    collectionTotalPage(2);
    myCollectArticles([
      ArticleModel(
        id: 0,
        title: 'title',
        tags: [TagModel(id: '1', name: 'name')],
        createdTime: DateTime.now(),
        content: 'content',
        image:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        creatorId: 0,
        creatorName: 'creatorName',
        creatorImage:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        good: 10,
        viewed: 5602,
        isCollected: true,
      ),
      ArticleModel(
        id: 0,
        title: 'title',
        tags: [TagModel(id: '1', name: 'name')],
        createdTime: DateTime.now(),
        content: 'content',
        image:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        creatorId: 0,
        creatorName: 'creatorName',
        creatorImage:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        good: 10,
        viewed: 5602,
        isCollected: false,
      ),
      ArticleModel(
        id: 0,
        title: 'title',
        tags: [TagModel(id: '1', name: 'name')],
        createdTime: DateTime.now(),
        content: 'content',
        image:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        creatorId: 0,
        creatorName: 'creatorName',
        creatorImage:
            'https://images.pexels.com/photos/2770371/pexels-photo-2770371.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        good: 10,
        viewed: 5602,
        isCollected: false,
      ),
    ]);
    collectionState(LoadingState.finished);
  }
}
