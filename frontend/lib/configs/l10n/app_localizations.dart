import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ja.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ja')
  ];

  /// No description provided for @title.
  ///
  /// In ja, this message translates to:
  /// **'オトモ'**
  String get title;

  /// No description provided for @terms.
  ///
  /// In ja, this message translates to:
  /// **'利用規約'**
  String get terms;

  /// No description provided for @birthday.
  ///
  /// In ja, this message translates to:
  /// **'生年月日'**
  String get birthday;

  /// No description provided for @email.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレス'**
  String get email;

  /// No description provided for @next.
  ///
  /// In ja, this message translates to:
  /// **'次へ'**
  String get next;

  /// No description provided for @ok.
  ///
  /// In ja, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @inquiry.
  ///
  /// In ja, this message translates to:
  /// **'お問い合わせ'**
  String get inquiry;

  /// No description provided for @signOut.
  ///
  /// In ja, this message translates to:
  /// **'サインアウト'**
  String get signOut;

  /// No description provided for @settingsPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get settingsPageTitle;

  /// No description provided for @settingsPageAccountSection.
  ///
  /// In ja, this message translates to:
  /// **'アカウント'**
  String get settingsPageAccountSection;

  /// No description provided for @settingsPageHelpSection.
  ///
  /// In ja, this message translates to:
  /// **'ヘルプ'**
  String get settingsPageHelpSection;

  /// No description provided for @settingsPageAccountDeletion.
  ///
  /// In ja, this message translates to:
  /// **'アカウント削除'**
  String get settingsPageAccountDeletion;

  /// No description provided for @settingsPageVersion.
  ///
  /// In ja, this message translates to:
  /// **'バージョン {version} ({buildNumber})'**
  String settingsPageVersion(String version, String buildNumber);

  /// No description provided for @signInWithGoogle.
  ///
  /// In ja, this message translates to:
  /// **'Googleでサインイン'**
  String get signInWithGoogle;

  /// No description provided for @signInWithApple.
  ///
  /// In ja, this message translates to:
  /// **'Appleでサインイン'**
  String get signInWithApple;

  /// No description provided for @signInWithEmail.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレスでサインイン'**
  String get signInWithEmail;

  /// No description provided for @signInWithEmailLinkPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレスでサインイン'**
  String get signInWithEmailLinkPageTitle;

  /// No description provided for @signInWithEmailLinkPageNoticeSentEmail.
  ///
  /// In ja, this message translates to:
  /// **'メールアドレスに認証リンクをお送りしましたので、リンクをタップして認証を完了してください。\n\n※ メールが届いてない場合、迷惑メールボックスに入っている、もしくは、メールアドレスが間違っている可能性があります。'**
  String get signInWithEmailLinkPageNoticeSentEmail;

  /// No description provided for @signInWithEmailLinkPageNoticeSendAuthEmail.
  ///
  /// In ja, this message translates to:
  /// **'認証メールを送信'**
  String get signInWithEmailLinkPageNoticeSendAuthEmail;

  /// No description provided for @startToUsePageTitle.
  ///
  /// In ja, this message translates to:
  /// **'利用を開始'**
  String get startToUsePageTitle;

  /// No description provided for @startToUsePageAgreeWithTerms.
  ///
  /// In ja, this message translates to:
  /// **'{terms}に同意する'**
  String startToUsePageAgreeWithTerms(String terms);

  /// No description provided for @startToUsePageNoticeAgeLimit.
  ///
  /// In ja, this message translates to:
  /// **'年齢制限のため生年月日を取得させていただきます。{age}歳未満の方はご利用することができません。'**
  String startToUsePageNoticeAgeLimit(num age);

  /// No description provided for @inputInvalidRequired.
  ///
  /// In ja, this message translates to:
  /// **'{field}を入力してください。'**
  String inputInvalidRequired(String field);

  /// No description provided for @inputInvalid.
  ///
  /// In ja, this message translates to:
  /// **'{field}が正しくありません。'**
  String inputInvalid(String field);

  /// No description provided for @inputInvalidLimitAge.
  ///
  /// In ja, this message translates to:
  /// **'{age}歳未満の方はご利用いただけません。'**
  String inputInvalidLimitAge(num age);

  /// No description provided for @errorsUnknown.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました。'**
  String get errorsUnknown;

  /// No description provided for @errorsNetwork.
  ///
  /// In ja, this message translates to:
  /// **'ネットワークエラーが発生しました。'**
  String get errorsNetwork;

  /// No description provided for @errorsInvalidArgument.
  ///
  /// In ja, this message translates to:
  /// **'入力が正しくありません。'**
  String get errorsInvalidArgument;

  /// No description provided for @errorsNotFound.
  ///
  /// In ja, this message translates to:
  /// **'該当するデータがありません。'**
  String get errorsNotFound;

  /// No description provided for @errorsAlreadyExist.
  ///
  /// In ja, this message translates to:
  /// **'すでにデータが存在します。'**
  String get errorsAlreadyExist;

  /// No description provided for @errorsPermissionDenied.
  ///
  /// In ja, this message translates to:
  /// **'アクセス権限がありません。'**
  String get errorsPermissionDenied;

  /// No description provided for @errorsUnauthenticated.
  ///
  /// In ja, this message translates to:
  /// **'認証に失敗しました。'**
  String get errorsUnauthenticated;

  /// No description provided for @errorsRequiresRecentLogin.
  ///
  /// In ja, this message translates to:
  /// **'再ログインが必要です。'**
  String get errorsRequiresRecentLogin;

  /// No description provided for @errorsFailedExtractingPlace.
  ///
  /// In ja, this message translates to:
  /// **'地名の解析に失敗しました。'**
  String get errorsFailedExtractingPlace;

  /// No description provided for @errorsLimitSendMessage.
  ///
  /// In ja, this message translates to:
  /// **'メッセージの送信回数が上限に達しました。'**
  String get errorsLimitSendMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
