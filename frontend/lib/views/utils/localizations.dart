import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';

AppLocalizations _preferredLocalizations() =>
    lookupAppLocalizations(AppLocalizations.supportedLocales.first);

extension AppLocalizationsEx on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? _preferredLocalizations();

  static AppLocalizations get ofLocale {
    final parts = Intl.getCurrentLocale().split('_');
    final isSupported = AppLocalizations.supportedLocales
        .any((e) => parts.first == e.languageCode);
    if (isSupported) return lookupAppLocalizations(Locale(parts.first));
    return _preferredLocalizations();
  }
}
