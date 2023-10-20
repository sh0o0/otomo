import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';

Locale getCurrentLocale() {
  final parts = Intl.getCurrentLocale().split('_');
  final isSupported = AppLocalizations.supportedLocales
      .any((e) => parts.first == e.languageCode);
  if (isSupported) return Locale(parts.first);
  return preferredLocale;
}

Locale localeOf(BuildContext context) => Localizations.localeOf(context);

final Locale preferredLocale = AppLocalizations.supportedLocales.first;

extension BuildContextForLocalizationsEx on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? preferredLocale.l10n;
}

extension LocaleForLocalizationsEx on Locale {
  AppLocalizations get l10n => lookupAppLocalizations(this);
}
