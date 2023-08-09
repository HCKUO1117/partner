import 'package:partner/models/tag_model.dart';

class ResumeModel {
  int userId;
  String nickname;
  String profile;
  String shortIntro;
  String completeIntro;
  List<SkillModel> skillList;
  List<PortfolioModel> portfolioList;
  List<String> experiences;
  List<TagModel> tags;
  List<String> contacts;
  bool open;

  factory ResumeModel.sample() {
    return ResumeModel(
      userId: 1,
      nickname: 'nickname',
      profile:
          'https://janstockcoin.com/wp-content/uploads/2021/06/pexels-photo-747964-2048x1293.jpeg',
      shortIntro: '',
      completeIntro: '',
      portfolioList: [],
      experiences: [],
      tags: [],
      contacts: [],
      skillList: [],
      open: true,
    );
  }

  ResumeModel({
    required this.userId,
    required this.nickname,
    required this.profile,
    required this.shortIntro,
    required this.completeIntro,
    required this.portfolioList,
    required this.experiences,
    required this.tags,
    required this.contacts,
    required this.skillList,
    required this.open,
  });
}

class PortfolioModel {
  String name;
  List<String> images;
  String description;
  String? link;

  PortfolioModel({
    required this.name,
    required this.images,
    required this.description,
    this.link,
  });
}

class SkillModel {
  String name;
  String description;

  SkillModel({
    required this.name,
    required this.description,
  });
}

class ContactModel {
  String name;
  String description;

  ContactModel({
    required this.name,
    required this.description,
  });
}
