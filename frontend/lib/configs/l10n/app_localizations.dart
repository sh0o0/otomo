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
  /// **'Otomo'**
  String get title;

  /// No description provided for @otomo.
  ///
  /// In ja, this message translates to:
  /// **'Otomo'**
  String get otomo;

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

  /// No description provided for @date.
  ///
  /// In ja, this message translates to:
  /// **'日付'**
  String get date;

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

  /// No description provided for @cancel.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In ja, this message translates to:
  /// **'確定'**
  String get confirm;

  /// No description provided for @copied.
  ///
  /// In ja, this message translates to:
  /// **'コピーしました。'**
  String get copied;

  /// No description provided for @openOnGoogleMap.
  ///
  /// In ja, this message translates to:
  /// **'Googleマップで開く'**
  String get openOnGoogleMap;

  /// No description provided for @inquiry.
  ///
  /// In ja, this message translates to:
  /// **'お問い合わせ'**
  String get inquiry;

  /// No description provided for @online.
  ///
  /// In ja, this message translates to:
  /// **'オンライン'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In ja, this message translates to:
  /// **'オフライン'**
  String get offline;

  /// No description provided for @signOut.
  ///
  /// In ja, this message translates to:
  /// **'サインアウト'**
  String get signOut;

  /// No description provided for @accountDeletion.
  ///
  /// In ja, this message translates to:
  /// **'アカウント削除'**
  String get accountDeletion;

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

  /// No description provided for @errorUnknown.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました。'**
  String get errorUnknown;

  /// No description provided for @errorNetwork.
  ///
  /// In ja, this message translates to:
  /// **'ネットワークエラーが発生しました。'**
  String get errorNetwork;

  /// No description provided for @errorInvalidArgument.
  ///
  /// In ja, this message translates to:
  /// **'入力が正しくありません。'**
  String get errorInvalidArgument;

  /// No description provided for @errorNotFound.
  ///
  /// In ja, this message translates to:
  /// **'該当するデータがありません。'**
  String get errorNotFound;

  /// No description provided for @errorAlreadyExist.
  ///
  /// In ja, this message translates to:
  /// **'すでにデータが存在します。'**
  String get errorAlreadyExist;

  /// No description provided for @errorPermissionDenied.
  ///
  /// In ja, this message translates to:
  /// **'アクセス権限がありません。'**
  String get errorPermissionDenied;

  /// No description provided for @errorUnauthenticated.
  ///
  /// In ja, this message translates to:
  /// **'認証に失敗しました。'**
  String get errorUnauthenticated;

  /// No description provided for @errorRequiresRecentLogin.
  ///
  /// In ja, this message translates to:
  /// **'再ログインが必要です。'**
  String get errorRequiresRecentLogin;

  /// No description provided for @errorFailedExtractingPlace.
  ///
  /// In ja, this message translates to:
  /// **'地名の解析に失敗しました。'**
  String get errorFailedExtractingPlace;

  /// No description provided for @errorLimitSendMessage.
  ///
  /// In ja, this message translates to:
  /// **'メッセージの送信回数が上限に達しました。'**
  String get errorLimitSendMessage;

  /// No description provided for @errorFetchImage.
  ///
  /// In ja, this message translates to:
  /// **'画像の取得に失敗しました。'**
  String get errorFetchImage;

  /// No description provided for @chatDailyLimitCount.
  ///
  /// In ja, this message translates to:
  /// **'\'今日の残り: {count} 回'**
  String chatDailyLimitCount(num count);

  /// No description provided for @chatMonthlySurplusLimitCount.
  ///
  /// In ja, this message translates to:
  /// **'今月の追加分残り: {count} 回'**
  String chatMonthlySurplusLimitCount(num count);

  /// No description provided for @chatAttachmentButtonAccessibilityLabel.
  ///
  /// In ja, this message translates to:
  /// **'メディアを送付'**
  String get chatAttachmentButtonAccessibilityLabel;

  /// No description provided for @chatEmptyChatPlaceholder.
  ///
  /// In ja, this message translates to:
  /// **'メッセージはありません'**
  String get chatEmptyChatPlaceholder;

  /// No description provided for @chatFileButtonAccessibilityLabel.
  ///
  /// In ja, this message translates to:
  /// **'ファイル'**
  String get chatFileButtonAccessibilityLabel;

  /// No description provided for @chatInputPlaceholder.
  ///
  /// In ja, this message translates to:
  /// **'メッセージ'**
  String get chatInputPlaceholder;

  /// No description provided for @chatSendButtonAccessibilityLabel.
  ///
  /// In ja, this message translates to:
  /// **'送信'**
  String get chatSendButtonAccessibilityLabel;

  /// No description provided for @chatUnreadMessagesLabel.
  ///
  /// In ja, this message translates to:
  /// **'未読メッセージ'**
  String get chatUnreadMessagesLabel;

  /// No description provided for @placeDetails.
  ///
  /// In ja, this message translates to:
  /// **'詳細'**
  String get placeDetails;

  /// No description provided for @placeBusinessHours.
  ///
  /// In ja, this message translates to:
  /// **'営業時間'**
  String get placeBusinessHours;

  /// No description provided for @placeOpen.
  ///
  /// In ja, this message translates to:
  /// **'営業中'**
  String get placeOpen;

  /// No description provided for @placeClosed.
  ///
  /// In ja, this message translates to:
  /// **'営業時間外'**
  String get placeClosed;

  /// No description provided for @placeBusinessHoursPeriod.
  ///
  /// In ja, this message translates to:
  /// **'{day}日: {timePeriod}'**
  String placeBusinessHoursPeriod(num day, String timePeriod);

  /// No description provided for @placeRating.
  ///
  /// In ja, this message translates to:
  /// **'評価'**
  String get placeRating;

  /// No description provided for @placeReviews.
  ///
  /// In ja, this message translates to:
  /// **'レビュー'**
  String get placeReviews;

  /// No description provided for @placeTypeArchipelago.
  ///
  /// In ja, this message translates to:
  /// **'群島'**
  String get placeTypeArchipelago;

  /// No description provided for @placeTypeContinent.
  ///
  /// In ja, this message translates to:
  /// **'大陸'**
  String get placeTypeContinent;

  /// No description provided for @placeTypeCountry.
  ///
  /// In ja, this message translates to:
  /// **'国'**
  String get placeTypeCountry;

  /// No description provided for @placeTypeEstablishment.
  ///
  /// In ja, this message translates to:
  /// **'施設'**
  String get placeTypeEstablishment;

  /// No description provided for @placeTypeFinance.
  ///
  /// In ja, this message translates to:
  /// **'金融'**
  String get placeTypeFinance;

  /// No description provided for @placeTypeFloor.
  ///
  /// In ja, this message translates to:
  /// **'フロア'**
  String get placeTypeFloor;

  /// No description provided for @placeTypeFood.
  ///
  /// In ja, this message translates to:
  /// **'食べ物'**
  String get placeTypeFood;

  /// No description provided for @placeTypeGeneralContractor.
  ///
  /// In ja, this message translates to:
  /// **'総合請負業者'**
  String get placeTypeGeneralContractor;

  /// No description provided for @placeTypeHealth.
  ///
  /// In ja, this message translates to:
  /// **'健康'**
  String get placeTypeHealth;

  /// No description provided for @placeTypeIntersection.
  ///
  /// In ja, this message translates to:
  /// **'交差点'**
  String get placeTypeIntersection;

  /// No description provided for @placeTypeLandmark.
  ///
  /// In ja, this message translates to:
  /// **'ランドマーク'**
  String get placeTypeLandmark;

  /// No description provided for @placeTypeLocality.
  ///
  /// In ja, this message translates to:
  /// **'地域'**
  String get placeTypeLocality;

  /// No description provided for @placeTypeNaturalFeature.
  ///
  /// In ja, this message translates to:
  /// **'自然地形'**
  String get placeTypeNaturalFeature;

  /// No description provided for @placeTypeNeighborhood.
  ///
  /// In ja, this message translates to:
  /// **'近隣地域'**
  String get placeTypeNeighborhood;

  /// No description provided for @placeTypePlaceOfWorship.
  ///
  /// In ja, this message translates to:
  /// **'礼拝所'**
  String get placeTypePlaceOfWorship;

  /// No description provided for @placeTypePointOfInterest.
  ///
  /// In ja, this message translates to:
  /// **'興味'**
  String get placeTypePointOfInterest;

  /// No description provided for @placeTypePolitical.
  ///
  /// In ja, this message translates to:
  /// **'政治'**
  String get placeTypePolitical;

  /// No description provided for @placeTypePostBox.
  ///
  /// In ja, this message translates to:
  /// **'郵便ポスト'**
  String get placeTypePostBox;

  /// No description provided for @placeTypePremise.
  ///
  /// In ja, this message translates to:
  /// **'敷地'**
  String get placeTypePremise;

  /// No description provided for @placeTypeRoom.
  ///
  /// In ja, this message translates to:
  /// **'部屋'**
  String get placeTypeRoom;

  /// No description provided for @placeTypeRoute.
  ///
  /// In ja, this message translates to:
  /// **'ルート'**
  String get placeTypeRoute;

  /// No description provided for @placeTypeStreetAddress.
  ///
  /// In ja, this message translates to:
  /// **'住所'**
  String get placeTypeStreetAddress;

  /// No description provided for @placeTypeStreetNumber.
  ///
  /// In ja, this message translates to:
  /// **'番地'**
  String get placeTypeStreetNumber;

  /// No description provided for @placeTypeSublocality.
  ///
  /// In ja, this message translates to:
  /// **'地下地域'**
  String get placeTypeSublocality;

  /// No description provided for @placeTypeTownSquare.
  ///
  /// In ja, this message translates to:
  /// **'広場'**
  String get placeTypeTownSquare;

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

  /// No description provided for @settingsPageVersion.
  ///
  /// In ja, this message translates to:
  /// **'バージョン {version} ({buildNumber})'**
  String settingsPageVersion(String version, String buildNumber);

  /// No description provided for @accountDeletionPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'アカウント削除'**
  String get accountDeletionPageTitle;

  /// No description provided for @accountDeletionPageWarn.
  ///
  /// In ja, this message translates to:
  /// **'アカウントが削除されます。'**
  String get accountDeletionPageWarn;

  /// No description provided for @accountDeletionPageExplanation.
  ///
  /// In ja, this message translates to:
  /// **'アカウントを削除すると、データの復元はできませんのでご注意ください。\nまた、削除されたアカウントについては、Otomo運営事務局のサポート外となります'**
  String get accountDeletionPageExplanation;
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
