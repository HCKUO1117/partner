import 'package:partner/models/tag_model.dart';

class ArticleModel {
  int id;
  String title;
  String content;
  List<TagModel> tags;
  DateTime createdTime;
  String image;
  int creatorId;
  String creatorName;
  String creatorImage;
  int good;
  int viewed;
  bool isCollected;

  ArticleModel({
    required this.id,
    required this.title,
    required this.tags,
    required this.createdTime,
    required this.content,
    required this.image,
    required this.creatorId,
    required this.creatorName,
    required this.creatorImage,
    required this.good,
    required this.viewed,
    required this.isCollected,
  });
}
