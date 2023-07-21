class ResumeModel {
  int userId;
  String nickname;
  String profile;
  String? shortIntro;
  String? completeIntro;
  List<SkillModel> skillList;
  List<String> experiences;

  factory ResumeModel.sample() {
    return ResumeModel(
      userId: 1,
      nickname: 'nickname',
      profile:
          'https://janstockcoin.com/wp-content/uploads/2021/06/pexels-photo-747964-2048x1293.jpeg',
      skillList: [],
      experiences: [],
    );
  }

  ResumeModel({
    required this.userId,
    required this.nickname,
    required this.profile,
    this.shortIntro,
    this.completeIntro,
    required this.skillList,
    required this.experiences,
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
