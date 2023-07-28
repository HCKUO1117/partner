import 'package:partner/models/tag_model.dart';

class ResumeModel {
  int userId;
  String nickname;
  String profile;
  String shortIntro;
  String completeIntro;
  List<SkillModel> skillList;
  List<String> experiences;
  List<TagModel> tags;

  factory ResumeModel.sample() {
    return ResumeModel(
      userId: 1,
      nickname: 'nickname',
      profile:
          'https://janstockcoin.com/wp-content/uploads/2021/06/pexels-photo-747964-2048x1293.jpeg',
      shortIntro: '',
      completeIntro: '',
      skillList: [],
      experiences: [],
      tags: [],
    );
  }

  ResumeModel({
    required this.userId,
    required this.nickname,
    required this.profile,
    required this.shortIntro,
    required this.completeIntro,
    required this.skillList,
    required this.experiences,
    required this.tags,
  });
}

class SkillModel {
  String name;
  List<String> images;

  SkillModel({
    required this.name,
    required this.images,
  });
}
