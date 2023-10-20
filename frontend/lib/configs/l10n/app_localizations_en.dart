import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Otomo';

  @override
  String get otomo => 'Otomo';

  @override
  String get terms => 'Terms of Use';

  @override
  String get birthday => 'Birthday';

  @override
  String get email => 'Email';

  @override
  String get date => 'Date';

  @override
  String get next => 'Next';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get copied => 'Copied!';

  @override
  String get openOnGoogleMap => 'Open on Google Map';

  @override
  String get inquiry => 'Inquiry';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get signOut => 'Sign Out';

  @override
  String get accountDeletion => 'Account Deletion';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signInWithApple => 'Sign in with Apple';

  @override
  String get signInWithEmail => 'Sign in with Email';

  @override
  String inputInvalidRequired(String field) {
    return 'Please enter $field.';
  }

  @override
  String inputInvalid(String field) {
    return '$field is invalid.';
  }

  @override
  String inputInvalidLimitAge(num age) {
    return 'You must be over $age years old to use this service.';
  }

  @override
  String get errorUnknown => 'An error occurred.';

  @override
  String get errorNetwork => 'A network error occurred.';

  @override
  String get errorInvalidArgument => 'The input is invalid.';

  @override
  String get errorNotFound => 'No data found.';

  @override
  String get errorAlreadyExist => 'Data already exists.';

  @override
  String get errorPermissionDenied => 'Access denied.';

  @override
  String get errorUnauthenticated => 'Authentication failed.';

  @override
  String get errorRequiresRecentLogin => 'You need to log in again.';

  @override
  String get errorFailedExtractingPlace => 'Failed to extract place name.';

  @override
  String get errorLimitSendMessage => 'The number of messages sent has reached the limit.';

  @override
  String get errorFetchImage => 'Failed to fetch image.';

  @override
  String chatDailyLimitCount(num count) {
    return '\'Remaining today: $count times';
  }

  @override
  String chatMonthlySurplusLimitCount(num count) {
    return 'Additional remaining this month: $count times';
  }

  @override
  String get chatAttachmentButtonAccessibilityLabel => 'Attach media';

  @override
  String get chatEmptyChatPlaceholder => 'No messages';

  @override
  String get chatFileButtonAccessibilityLabel => 'File';

  @override
  String get chatInputPlaceholder => 'Message';

  @override
  String get chatSendButtonAccessibilityLabel => 'Send';

  @override
  String get chatUnreadMessagesLabel => 'Unread messages';

  @override
  String get placeDetails => 'Details';

  @override
  String get placeBusinessHours => 'Business hours';

  @override
  String get placeOpen => 'Open';

  @override
  String get placeClosed => 'Closed';

  @override
  String placeBusinessHoursPeriod(num day, String timePeriod) {
    return '$day: $timePeriod';
  }

  @override
  String get placeRating => 'Rating';

  @override
  String get placeReviews => 'Reviews';

  @override
  String get placeTypeArchipelago => 'Archipelago';

  @override
  String get placeTypeContinent => 'Continent';

  @override
  String get placeTypeCountry => 'Country';

  @override
  String get placeTypeEstablishment => 'Establishment';

  @override
  String get placeTypeFinance => 'Finance';

  @override
  String get placeTypeFloor => 'Floor';

  @override
  String get placeTypeFood => 'Food';

  @override
  String get placeTypeGeneralContractor => 'General contractor';

  @override
  String get placeTypeHealth => 'Health';

  @override
  String get placeTypeIntersection => 'Intersection';

  @override
  String get placeTypeLandmark => 'Landmark';

  @override
  String get placeTypeLocality => 'Locality';

  @override
  String get placeTypeNaturalFeature => 'Natural feature';

  @override
  String get placeTypeNeighborhood => 'Neighborhood';

  @override
  String get placeTypePlaceOfWorship => 'Place of worship';

  @override
  String get placeTypePointOfInterest => 'Point of interest';

  @override
  String get placeTypePolitical => 'Political';

  @override
  String get placeTypePostBox => 'Post box';

  @override
  String get placeTypePremise => 'Premise';

  @override
  String get placeTypeRoom => 'Room';

  @override
  String get placeTypeRoute => 'Route';

  @override
  String get placeTypeStreetAddress => 'Street address';

  @override
  String get placeTypeStreetNumber => 'Street number';

  @override
  String get placeTypeSublocality => 'Sublocality';

  @override
  String get placeTypeTownSquare => 'Town square';

  @override
  String get signInWithEmailLinkPageTitle => 'Sign in with Email';

  @override
  String get signInWithEmailLinkPageNoticeSentEmail => 'We have sent an authentication link to your email address. Please tap the link to complete the authentication.\n\n※ If you have not received the email, it may be in your spam folder or your email address may be incorrect.';

  @override
  String get signInWithEmailLinkPageNoticeSendAuthEmail => 'Send authentication email';

  @override
  String get startToUsePageTitle => 'Start to use';

  @override
  String startToUsePageAgreeWithTerms(String terms) {
    return 'I agree to the $terms';
  }

  @override
  String startToUsePageNoticeAgeLimit(num age) {
    return 'We need to obtain your date of birth due to age restrictions. You must be over $age years old to use this service.';
  }

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get settingsPageAccountSection => 'Account';

  @override
  String get settingsPageHelpSection => 'Help';

  @override
  String settingsPageVersion(String version, String buildNumber) {
    return 'Version $version ($buildNumber)';
  }

  @override
  String get accountDeletionPageTitle => 'Account Deletion';

  @override
  String get accountDeletionPageWarn => 'Your account will be deleted.';

  @override
  String get accountDeletionPageExplanation => 'Please note that once your account is deleted, your data cannot be restored. In addition, support for deleted accounts will be outside the scope of Otomo\'s support team.';
}
