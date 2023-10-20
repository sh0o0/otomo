import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'Otomo';

  @override
  String get otomo => 'Otomo';

  @override
  String get terms => '利用規約';

  @override
  String get birthday => '生年月日';

  @override
  String get email => 'メールアドレス';

  @override
  String get next => '次へ';

  @override
  String get ok => 'OK';

  @override
  String get inquiry => 'お問い合わせ';

  @override
  String get online => 'オンライン';

  @override
  String get offline => 'オフライン';

  @override
  String get signOut => 'サインアウト';

  @override
  String get accountDeletion => 'アカウント削除';

  @override
  String get signInWithGoogle => 'Googleでサインイン';

  @override
  String get signInWithApple => 'Appleでサインイン';

  @override
  String get signInWithEmail => 'メールアドレスでサインイン';

  @override
  String inputInvalidRequired(String field) {
    return '$fieldを入力してください。';
  }

  @override
  String inputInvalid(String field) {
    return '$fieldが正しくありません。';
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

  @override
  String chatDailyLimitCount(num count) {
    return '\'今日の残り: $count 回';
  }

  @override
  String chatMonthlySurplusLimitCount(num count) {
    return '今月の追加分残り: $count 回';
  }

  @override
  String get chatAttachmentButtonAccessibilityLabel => 'メディアを送付';

  @override
  String get chatEmptyChatPlaceholder => 'メッセージはありません';

  @override
  String get chatFileButtonAccessibilityLabel => 'ファイル';

  @override
  String get chatInputPlaceholder => 'メッセージ';

  @override
  String get chatSendButtonAccessibilityLabel => '送信';

  @override
  String get chatUnreadMessagesLabel => '未読メッセージ';

  @override
  String get signInWithEmailLinkPageTitle => 'メールアドレスでサインイン';

  @override
  String get signInWithEmailLinkPageNoticeSentEmail => 'メールアドレスに認証リンクをお送りしましたので、リンクをタップして認証を完了してください。\n\n※ メールが届いてない場合、迷惑メールボックスに入っている、もしくは、メールアドレスが間違っている可能性があります。';

  @override
  String get signInWithEmailLinkPageNoticeSendAuthEmail => '認証メールを送信';

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
  String get settingsPageTitle => '設定';

  @override
  String get settingsPageAccountSection => 'アカウント';

  @override
  String get settingsPageHelpSection => 'ヘルプ';

  @override
  String settingsPageVersion(String version, String buildNumber) {
    return 'バージョン $version ($buildNumber)';
  }

  @override
  String get accountDeletionPageTitle => 'アカウント削除';

  @override
  String get accountDeletionPageWarn => 'アカウントが削除されます。';

  @override
  String get accountDeletionPageExplanation => 'アカウントを削除すると、データの復元はできませんのでご注意ください。\nまた、削除されたアカウントについては、Otomo運営事務局のサポート外となります';
}
