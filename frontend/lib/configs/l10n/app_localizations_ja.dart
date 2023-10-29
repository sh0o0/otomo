import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'Otomo';

  @override
  String get otomo => 'オトモ';

  @override
  String get terms => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get birthday => '生年月日';

  @override
  String get email => 'メールアドレス';

  @override
  String get date => '日付';

  @override
  String get speakLanguage => '話す言語';

  @override
  String get next => '次へ';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確定';

  @override
  String get copied => 'コピーしました。';

  @override
  String get openOnGoogleMap => 'Googleマップで開く';

  @override
  String get contactUs => 'お問い合わせ';

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
  String get errorUnknown => 'エラーが発生しました。';

  @override
  String get errorNetwork => 'ネットワークエラーが発生しました。';

  @override
  String get errorInvalidArgument => '入力が正しくありません。';

  @override
  String get errorNotFound => '該当するデータがありません。';

  @override
  String get errorAlreadyExist => 'すでにデータが存在します。';

  @override
  String get errorPermissionDenied => 'アクセス権限がありません。';

  @override
  String get errorUnauthenticated => '認証に失敗しました。';

  @override
  String get errorRequiresRecentLogin => '再ログインが必要です。';

  @override
  String get errorFailedExtractingPlace => '地名の解析に失敗しました。';

  @override
  String get errorLimitSendMessage => 'メッセージの送信回数が上限に達しました。';

  @override
  String get errorFetchImage => '画像の取得に失敗しました。';

  @override
  String chatDailyLimitCount(num count) {
    return '今日の残り: $count 回';
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
  String get placeDetails => '詳細';

  @override
  String get placeBusinessHours => '営業時間';

  @override
  String get placeOpen => '営業中';

  @override
  String get placeClosed => '営業時間外';

  @override
  String placeBusinessHoursPeriod(num day, String timePeriod) {
    return '$day日: $timePeriod';
  }

  @override
  String get placeRating => '評価';

  @override
  String get placeReviews => 'レビュー';

  @override
  String get placeTypeArchipelago => '群島';

  @override
  String get placeTypeContinent => '大陸';

  @override
  String get placeTypeCountry => '国';

  @override
  String get placeTypeEstablishment => '施設';

  @override
  String get placeTypeFinance => '金融';

  @override
  String get placeTypeFloor => 'フロア';

  @override
  String get placeTypeFood => '食べ物';

  @override
  String get placeTypeGeneralContractor => '総合請負業者';

  @override
  String get placeTypeHealth => '健康';

  @override
  String get placeTypeIntersection => '交差点';

  @override
  String get placeTypeLandmark => 'ランドマーク';

  @override
  String get placeTypeLocality => '地域';

  @override
  String get placeTypeNaturalFeature => '自然地形';

  @override
  String get placeTypeNeighborhood => '近隣地域';

  @override
  String get placeTypePlaceOfWorship => '礼拝所';

  @override
  String get placeTypePointOfInterest => '興味';

  @override
  String get placeTypePolitical => '政治';

  @override
  String get placeTypePostBox => '郵便ポスト';

  @override
  String get placeTypePremise => '敷地';

  @override
  String get placeTypeRoom => '部屋';

  @override
  String get placeTypeRoute => 'ルート';

  @override
  String get placeTypeStreetAddress => '住所';

  @override
  String get placeTypeStreetNumber => '番地';

  @override
  String get placeTypeSublocality => '地下地域';

  @override
  String get placeTypeTownSquare => '広場';

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
  String get settingsPageAboutSection => 'アプリ';

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

  @override
  String get otomoProfilePageTitle => 'オトモプロフィール';
}
