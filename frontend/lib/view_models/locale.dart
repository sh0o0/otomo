import 'package:flutter/material.dart';
import 'package:otomo/views/utils/localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale.g.dart';

@riverpod
class LocaleVM extends _$LocaleVM {
  @override
  Locale build() {
    return getCurrentLocale();
  }
}
