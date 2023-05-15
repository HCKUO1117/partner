import 'package:partner/models/tag_model.dart';

class CaseModel {
  String title;
  String content;
  List<String> images;
  List<TagModel> tags;
  String location;
  String creatorId;
  String creatorName;
  DateTime createdTime;
  int category;

  CaseModel({
    required this.title,
    required this.content,
    required this.tags,
    required this.images,
    required this.location,
    required this.creatorId,
    required this.creatorName,
    required this.createdTime,
    required this.category
  });
}
