enum ScreenNames {
  home,
  otomoProfile,
  settings,
  accountDeletion,
  loading,
  splash,
  signIn,
  signInWithEmailLink,
  startToUse,
  chatSheet,
  placeDetailsSheet,
  placePhotoGallery,
  placeReviewsSheet,
}

extension ScreenNamesEx on ScreenNames {
  String get name => toString().split('.').last;
}
