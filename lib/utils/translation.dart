import 'package:get/get.dart';

class Messages extends Translations {
  static const String home = 'home';
  static const String recruit = 'recruit';
  static const String talents = 'talents';
  static const String articles = 'articles';
  static const String login = 'login';
  static const String register = 'register';
  static const String error = 'error';
  static const String more = 'more';

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
        }
      };
}
