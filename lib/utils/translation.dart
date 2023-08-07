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
  static const String others = 'others';
  static const String cancel = 'cancel';
  static const String confirm = 'confirm';
  static const String canNotEmpty = 'canNotEmpty';
  static const String noData = 'noData';
  static const String addSuccess = 'addSuccess';
  static const String deleteSuccess = 'deleteSuccess';
  static const String modifySuccess = 'modifySuccess';
  static const String delete = 'delete';
  static const String checkDelete = 'checkDelete';
  static const String modify = 'modify';
  static const String name = 'name';
  static const String images = 'images';
  static const String link = 'link';
  static const String contactMethod = 'contactMethod';
  static const String contactMethodHint = 'contactMethodHint';
  static const String open = 'open';

  ///會員中心
  static const String memberInfo = 'memberInfo';
  static const String myResume = 'myResume';
  static const String myArticles = 'myArticles';
  static const String myRecruits = 'myRecruits';
  static const String invites = 'invites';
  static const String phoneHint = 'phoneHint';
  static const String contactEmailHint = 'contactEmailHint';
  static const String selectYourGender = 'selectYourGender';
  static const String shortIntro = 'shortIntro';
  static const String completeIntro = 'completeIntro';
  static const String expertises = 'expertises';
  static const String experiences = 'experiences';
  static const String portfolio = 'Portfolio';
  static const String portfolioHint = 'portfolioHint';
  static const String illustrate = 'illustrate';
  static const String illustrateHint = 'illustrateHint';
  static const String moreThan5 = 'moreThan5';
  static const String linkHint = 'linkHint';

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
          nickName: '暱稱',
          phone: '手機號碼',
          contactEmail: '聯絡Email',
          account: '帳號',
          add: '新增',
          phoneHint: '驗證手機號碼可以增加您帳號的可信度，只有您自己看的到您的手機號碼',
          contactEmailHint: '您可以設定聯絡E-mail以接收partmingle的通知(未設定將會傳送通知至您的帳號E-mail)',
          male: '男',
          female: '女',
          unset: '未設定',
          secret: '保密',
          gender: '性別',
          others: '其他',
          selectYourGender: '選擇性別',
          shortIntro: '簡短介紹',
          completeIntro: '完整介紹',
          expertises: '專長',
          experiences: '經歷',
          cancel: '取消',
          confirm: '確認',
          canNotEmpty: '必填',
          portfolio: '作品集',
          portfolioHint: '您可以新增您的作品集(最多五張)',
          illustrate: '說明',
          illustrateHint: '簡要說明',
          moreThan5: '照片不得超過5張',
          noData: '沒有資料',
          addSuccess: '新增成功',
          deleteSuccess: '刪除成功',
          modifySuccess: '修改成功',
          delete: '刪除',
          checkDelete: '是否要刪除',
          modify: '修改',
          name: '名稱',
          images: '照片',
          link: '連結',
          linkHint: '您作品的連結',
          contactMethod: '聯絡方式',
          contactMethodHint: '設定您的聯絡方式，當您開放您的履歷時，所有人都看的到您的聯絡方式',
          open: '履歷開放',
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
          nickName: 'Nickname',
          phone: 'Cellphone number',
          contactEmail: 'Contact Email',
          account: 'Account',
          add: 'add',
          phoneHint:
              'Verifying your mobile number can increase the credibility of your account, only you can see your mobile number',
          contactEmailHint:
              'You can set your contact E-mail to receive notifications from partmingle (notifications will be sent to your account E-mail if not set)',
          male: 'male',
          female: 'female',
          unset: 'unset',
          secret: 'secret',
          gender: 'gender',
          others: 'others',
          selectYourGender: 'Select Your Gender',
          shortIntro: 'Short introduction',
          completeIntro: 'Complete introduction',
          expertises: 'Expertises',
          experiences: 'Experiences',
          cancel: 'cancel',
          confirm: 'confirm',
          canNotEmpty: 'required',
          portfolio: 'Portfolio',
          portfolioHint: 'You can add your portfolio (up to five)',
          illustrate: 'Description',
          illustrateHint: 'Brief description',
          moreThan5: 'Photos must not exceed 5',
          noData: 'No data',
          addSuccess: 'Add success',
          deleteSuccess: 'Delete successfully',
          modifySuccess: 'Modify successfully',
          delete: 'Delete',
          checkDelete: 'Do you want to delete?',
          modify: 'Modify',
          name: 'Name',
          images: 'Photos',
          link: 'Link',
          linkHint: 'Link to your work',
          contactMethod: 'contact method',
          contactMethodHint:
              'Set your contact method, when you open your resume, everyone can see your contact method',
          open: 'Resume open',
        }
      };
}
