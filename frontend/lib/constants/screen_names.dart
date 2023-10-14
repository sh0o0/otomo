enum ScreenNames {
  home,
  settings,
  accountDeletion,
  loading,
  splash,
  signIn,
  signInWithEmailLink,
  startToUse,
  chatSheet,
  placeDetailsSheet,
}

extension ScreenNamesEx on ScreenNames {
  String get name => toString().split('.').last;
}
