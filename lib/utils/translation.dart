import 'package:get/get.dart';

class Messages extends Translations {
  ///常用
  static const String home = 'home';
  static const String recruit = 'recruit';
  static const String talents = 'talents';
  static const String articles = 'articles';
  static const String login = 'login';
  static const String register = 'register';
  static const String error = 'error';
  static const String more = 'more';
  static const String loading = 'loading';
  static const String defaultTitle = 'defaultTitle';

  ///會員中心
  static const String memberInfo = 'memberInfo';
  static const String myResume = 'myResume';
  static const String myArticles = 'myArticles';
  static const String myRecruits = 'myRecruits';
  static const String invites = 'invites';

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_TW': {
          home: '首頁',
          recruit: '招募',
          talents: '找人才',
          articles: '文章',
          login: '登入',
          register: '註冊',
          error: '錯誤',
          more: '更多',
          memberInfo: '會員資料',
          myResume: '我的履歷',
          myArticles: '我的文章',
          myRecruits: '我的招募',
          invites: '邀請',
          loading: '加載中...',
          defaultTitle:'Partmingle 找夥伴、找活動、學技能',
        },
        'en_US': {
          home: 'home',
          recruit: 'recruit',
          talents: 'talents',
          articles: 'articles',
          login: 'login',
          register: 'register',
          error: 'error',
          more: 'more',
          memberInfo: 'Member Information',
          myResume: 'My Resume',
          myArticles: 'My Articles',
          myRecruits: 'My Recruitments',
          invites: 'Invites',
          loading: 'loading...',
          defaultTitle:'Partmingle 找夥伴、找活動、學技能',
        }
      };
}
