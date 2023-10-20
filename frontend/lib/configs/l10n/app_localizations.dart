import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
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
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Otomo'**
  String get title;

  /// No description provided for @otomo.
  ///
  /// In en, this message translates to:
  /// **'Otomo'**
  String get otomo;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get terms;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get copied;

  /// No description provided for @openOnGoogleMap.
  ///
  /// In en, this message translates to:
  /// **'Open on Google Map'**
  String get openOnGoogleMap;

  /// No description provided for @inquiry.
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiry;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @accountDeletion.
  ///
  /// In en, this message translates to:
  /// **'Account Deletion'**
  String get accountDeletion;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get signInWithEmail;

  /// No description provided for @inputInvalidRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter {field}.'**
  String inputInvalidRequired(String field);

  /// No description provided for @inputInvalid.
  ///
  /// In en, this message translates to:
  /// **'{field} is invalid.'**
  String inputInvalid(String field);

  /// No description provided for @inputInvalidLimitAge.
  ///
  /// In en, this message translates to:
  /// **'You must be over {age} years old to use this service.'**
  String inputInvalidLimitAge(num age);

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An error occurred.'**
  String get errorUnknown;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'A network error occurred.'**
  String get errorNetwork;

  /// No description provided for @errorInvalidArgument.
  ///
  /// In en, this message translates to:
  /// **'The input is invalid.'**
  String get errorInvalidArgument;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'No data found.'**
  String get errorNotFound;

  /// No description provided for @errorAlreadyExist.
  ///
  /// In en, this message translates to:
  /// **'Data already exists.'**
  String get errorAlreadyExist;

  /// No description provided for @errorPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied.'**
  String get errorPermissionDenied;

  /// No description provided for @errorUnauthenticated.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed.'**
  String get errorUnauthenticated;

  /// No description provided for @errorRequiresRecentLogin.
  ///
  /// In en, this message translates to:
  /// **'You need to log in again.'**
  String get errorRequiresRecentLogin;

  /// No description provided for @errorFailedExtractingPlace.
  ///
  /// In en, this message translates to:
  /// **'Failed to extract place name.'**
  String get errorFailedExtractingPlace;

  /// No description provided for @errorLimitSendMessage.
  ///
  /// In en, this message translates to:
  /// **'The number of messages sent has reached the limit.'**
  String get errorLimitSendMessage;

  /// No description provided for @errorFetchImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch image.'**
  String get errorFetchImage;

  /// No description provided for @chatDailyLimitCount.
  ///
  /// In en, this message translates to:
  /// **'\'Remaining today: {count} times'**
  String chatDailyLimitCount(num count);

  /// No description provided for @chatMonthlySurplusLimitCount.
  ///
  /// In en, this message translates to:
  /// **'Additional remaining this month: {count} times'**
  String chatMonthlySurplusLimitCount(num count);

  /// No description provided for @chatAttachmentButtonAccessibilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Attach media'**
  String get chatAttachmentButtonAccessibilityLabel;

  /// No description provided for @chatEmptyChatPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'No messages'**
  String get chatEmptyChatPlaceholder;

  /// No description provided for @chatFileButtonAccessibilityLabel.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get chatFileButtonAccessibilityLabel;

  /// No description provided for @chatInputPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get chatInputPlaceholder;

  /// No description provided for @chatSendButtonAccessibilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get chatSendButtonAccessibilityLabel;

  /// No description provided for @chatUnreadMessagesLabel.
  ///
  /// In en, this message translates to:
  /// **'Unread messages'**
  String get chatUnreadMessagesLabel;

  /// No description provided for @placeDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get placeDetails;

  /// No description provided for @placeBusinessHours.
  ///
  /// In en, this message translates to:
  /// **'Business hours'**
  String get placeBusinessHours;

  /// No description provided for @placeOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get placeOpen;

  /// No description provided for @placeClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get placeClosed;

  /// No description provided for @placeBusinessHoursPeriod.
  ///
  /// In en, this message translates to:
  /// **'{day}: {timePeriod}'**
  String placeBusinessHoursPeriod(num day, String timePeriod);

  /// No description provided for @placeRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get placeRating;

  /// No description provided for @placeReviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get placeReviews;

  /// No description provided for @placeTypeArchipelago.
  ///
  /// In en, this message translates to:
  /// **'Archipelago'**
  String get placeTypeArchipelago;

  /// No description provided for @placeTypeContinent.
  ///
  /// In en, this message translates to:
  /// **'Continent'**
  String get placeTypeContinent;

  /// No description provided for @placeTypeCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get placeTypeCountry;

  /// No description provided for @placeTypeEstablishment.
  ///
  /// In en, this message translates to:
  /// **'Establishment'**
  String get placeTypeEstablishment;

  /// No description provided for @placeTypeFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get placeTypeFinance;

  /// No description provided for @placeTypeFloor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get placeTypeFloor;

  /// No description provided for @placeTypeFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get placeTypeFood;

  /// No description provided for @placeTypeGeneralContractor.
  ///
  /// In en, this message translates to:
  /// **'General contractor'**
  String get placeTypeGeneralContractor;

  /// No description provided for @placeTypeHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get placeTypeHealth;

  /// No description provided for @placeTypeIntersection.
  ///
  /// In en, this message translates to:
  /// **'Intersection'**
  String get placeTypeIntersection;

  /// No description provided for @placeTypeLandmark.
  ///
  /// In en, this message translates to:
  /// **'Landmark'**
  String get placeTypeLandmark;

  /// No description provided for @placeTypeLocality.
  ///
  /// In en, this message translates to:
  /// **'Locality'**
  String get placeTypeLocality;

  /// No description provided for @placeTypeNaturalFeature.
  ///
  /// In en, this message translates to:
  /// **'Natural feature'**
  String get placeTypeNaturalFeature;

  /// No description provided for @placeTypeNeighborhood.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood'**
  String get placeTypeNeighborhood;

  /// No description provided for @placeTypePlaceOfWorship.
  ///
  /// In en, this message translates to:
  /// **'Place of worship'**
  String get placeTypePlaceOfWorship;

  /// No description provided for @placeTypePointOfInterest.
  ///
  /// In en, this message translates to:
  /// **'Point of interest'**
  String get placeTypePointOfInterest;

  /// No description provided for @placeTypePolitical.
  ///
  /// In en, this message translates to:
  /// **'Political'**
  String get placeTypePolitical;

  /// No description provided for @placeTypePostBox.
  ///
  /// In en, this message translates to:
  /// **'Post box'**
  String get placeTypePostBox;

  /// No description provided for @placeTypePremise.
  ///
  /// In en, this message translates to:
  /// **'Premise'**
  String get placeTypePremise;

  /// No description provided for @placeTypeRoom.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get placeTypeRoom;

  /// No description provided for @placeTypeRoute.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get placeTypeRoute;

  /// No description provided for @placeTypeStreetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street address'**
  String get placeTypeStreetAddress;

  /// No description provided for @placeTypeStreetNumber.
  ///
  /// In en, this message translates to:
  /// **'Street number'**
  String get placeTypeStreetNumber;

  /// No description provided for @placeTypeSublocality.
  ///
  /// In en, this message translates to:
  /// **'Sublocality'**
  String get placeTypeSublocality;

  /// No description provided for @placeTypeTownSquare.
  ///
  /// In en, this message translates to:
  /// **'Town square'**
  String get placeTypeTownSquare;

  /// No description provided for @signInWithEmailLinkPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get signInWithEmailLinkPageTitle;

  /// No description provided for @signInWithEmailLinkPageNoticeSentEmail.
  ///
  /// In en, this message translates to:
  /// **'We have sent an authentication link to your email address. Please tap the link to complete the authentication.\n\n※ If you have not received the email, it may be in your spam folder or your email address may be incorrect.'**
  String get signInWithEmailLinkPageNoticeSentEmail;

  /// No description provided for @signInWithEmailLinkPageNoticeSendAuthEmail.
  ///
  /// In en, this message translates to:
  /// **'Send authentication email'**
  String get signInWithEmailLinkPageNoticeSendAuthEmail;

  /// No description provided for @startToUsePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Start to use'**
  String get startToUsePageTitle;

  /// No description provided for @startToUsePageAgreeWithTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the {terms}'**
  String startToUsePageAgreeWithTerms(String terms);

  /// No description provided for @startToUsePageNoticeAgeLimit.
  ///
  /// In en, this message translates to:
  /// **'We need to obtain your date of birth due to age restrictions. You must be over {age} years old to use this service.'**
  String startToUsePageNoticeAgeLimit(num age);

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @settingsPageAccountSection.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsPageAccountSection;

  /// No description provided for @settingsPageHelpSection.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsPageHelpSection;

  /// No description provided for @settingsPageVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({buildNumber})'**
  String settingsPageVersion(String version, String buildNumber);

  /// No description provided for @accountDeletionPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Deletion'**
  String get accountDeletionPageTitle;

  /// No description provided for @accountDeletionPageWarn.
  ///
  /// In en, this message translates to:
  /// **'Your account will be deleted.'**
  String get accountDeletionPageWarn;

  /// No description provided for @accountDeletionPageExplanation.
  ///
  /// In en, this message translates to:
  /// **'Please note that once your account is deleted, your data cannot be restored. In addition, support for deleted accounts will be outside the scope of Otomo\'s support team.'**
  String get accountDeletionPageExplanation;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
