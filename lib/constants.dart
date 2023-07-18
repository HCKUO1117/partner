import 'package:flutter/animation.dart';

class Constants {
  static Color primaryYellow = const Color(0xffffde59);
  static Color primaryOrange = const Color(0xffff914d);
  static Color primaryOrangeBackground = const Color(0xffff914d).withOpacity(0.1);
  static Color primaryYellowBackground = const Color(0xffffde59).withOpacity(0.1);

  ///routes
  //home
  static const String homeRoute = '/';
  //account
  static const String accountRoute = '/account';
  static const String accountInfoRoute = '/account/info';
  static const String accountResumeRoute = '/account/resume';
  static const String accountArticleRoute = '/account/article';
  static const String accountMyRecruitRoute = '/account/my_recruit';
  static const String accountInviteRoute = '/account/invite';

  ///params
  static const String token = 'token';

  static const double maxWidth = 1200;
  static const double firstChangeWidth = 900;
  static const double secondChangeWidth = 600;
}
