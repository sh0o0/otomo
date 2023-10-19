import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'オトモ';

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
