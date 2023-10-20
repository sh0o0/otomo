import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'オトモ';

  @override
  String get signOut => 'サインアウト';

  @override
  String get terms => '利用規約';

  @override
  String get birthday => '生年月日';

  @override
  String get next => '次へ';

  @override
  String get signInWithGoogle => 'Googleでサインイン';

  @override
  String get signInWithApple => 'Appleでサインイン';

  @override
  String get signInWithEmail => 'メールアドレスでサインイン';

  @override
  String get startToUsePageTitle => '利用を開始';

  @override
  String startToUsePageAgreeWithTerms(String terms) {
    return '$termsに同意する';
  }

  @override
  String startToUsePageNoticeAgeLimit(num age) {
    return '年齢制限のため生年月日を取得させていただきます。$age歳未満の方はご利用することができません。';
  }

  @override
  String inputInvalidRequired(String field) {
    return '$fieldを入力してください。';
  }

  @override
  String inputInvalidLimitAge(num age) {
    return '$age歳未満の方はご利用いただけません。';
  }

  @override
  String get errorsUnknown => 'エラーが発生しました。';

  @override
  String get errorsNetwork => 'ネットワークエラーが発生しました。';

  @override
  String get errorsInvalidArgument => '入力が正しくありません。';

  @override
  String get errorsNotFound => '該当するデータがありません。';

  @override
  String get errorsAlreadyExist => 'すでにデータが存在します。';

  @override
  String get errorsPermissionDenied => 'アクセス権限がありません。';

  @override
  String get errorsUnauthenticated => '認証に失敗しました。';

  @override
  String get errorsRequiresRecentLogin => '再ログインが必要です。';

  @override
  String get errorsFailedExtractingPlace => '地名の解析に失敗しました。';

  @override
  String get errorsLimitSendMessage => 'メッセージの送信回数が上限に達しました。';
}
