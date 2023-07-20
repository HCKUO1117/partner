import 'package:get/get.dart';
import 'package:partner/utils/translation.dart';

enum GenderType {
  unset,
  male,
  female,
}

extension GenderTypeEx on GenderType {
  String get text {
    switch (this) {
      case GenderType.male:
        return Messages.male.tr;
      case GenderType.female:
        return Messages.female.tr;
      case GenderType.unset:
        return Messages.secret.tr;
    }
  }
}

class UserModel {
  int id;
  String nickName;
  String profile;
  String email;
  String? contactEmail;
  String? phone;
  GenderType? genderType;

  bool get loaded => id != 0;

  factory UserModel.sample() {
    return UserModel(
      id: 1,
      nickName: 'testUser',
      profile:
          'https://janstockcoin.com/wp-content/uploads/2021/06/pexels-photo-747964-2048x1293.jpeg',
      email:
          'email@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.comemail@gmail.com',
    );
  }

  UserModel({
    required this.id,
    required this.nickName,
    required this.profile,
    required this.email,
    this.contactEmail,
    this.phone,
    this.genderType,
  });
}
