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
  static const String change = 'change';
  static const String save = 'save';
  static const String nickName = 'nickName';
  static const String phone = 'phone';
  static const String contactEmail = 'contactEmail';
  static const String account = 'account';
  static const String add = 'add';
  static const String male = 'male';
  static const String female = 'female';
  static const String unset = 'unset';
  static const String secret = 'secret';
  static const String gender = 'gender';

  ///會員中心
  static const String memberInfo = 'memberInfo';
  static const String myResume = 'myResume';
  static const String myArticles = 'myArticles';
  static const String myRecruits = 'myRecruits';
  static const String invites = 'invites';
  static const String phoneHint = 'phoneHint';
  static const String contactEmailHint = 'contactEmailHint';

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
          defaultTitle: 'Partmingle 找夥伴、找活動、學技能',
          change: '變更',
          save: '儲存',
          nickName:'暱稱',
          phone:'手機號碼',
          contactEmail:'聯絡Email',
          account:'帳號',
          add:'新增',
          phoneHint:'驗證手機號碼可以增加您帳號的可信度，只有您自己看的到您的手機號碼',
          contactEmailHint:'您可以設定聯絡E-mail以接收partmingle的通知(未設定將會傳送通知至您的帳號E-mail)，所有人都可以看到您的聯絡E-mail',
          male:'男',
          female:'女',
          unset:'未設定',
          secret:'保密',
          gender:'性別',
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
          defaultTitle: 'Partmingle 找夥伴、找活動、學技能',
          change: 'change',
          save: 'save',
          nickName:'nickname',
          phone:'cellphone number',
          contactEmail:'contact Email',
          account:'Account',
          add:'add',
          phoneHint: 'Verifying your mobile number can increase the credibility of your account, only you can see your mobile number',
          contactEmailHint: 'You can set your contact E-mail to receive notifications from partmingle (notifications will be sent to your account E-mail if not set), and everyone can see your contact E-mail',
          male: 'male',
          female:'female',
          unset:'unset',
          secret:'secret',
          gender:'gender',
        }
      };
}
