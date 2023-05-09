import 'package:partner/models/tag_model.dart';

class PersonModel {
  String id;
  String name;
  String image;
  String intro;
  List<TagModel> tags;

  PersonModel({
    required this.id,
    required this.name,
    required this.image,
    required this.intro,
    required this.tags,
  });
}
