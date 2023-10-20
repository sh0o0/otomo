import 'package:flutter/material.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';

Locale localeOf(BuildContext context) => Localizations.localeOf(context);

final Locale preferredLocale = AppLocalizations.supportedLocales.first;

extension BuildContextForLocalizationsEx on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? preferredLocale.l10n;
}

extension LocaleForLocalizationsEx on Locale {
  AppLocalizations get l10n => lookupAppLocalizations(this);
}
