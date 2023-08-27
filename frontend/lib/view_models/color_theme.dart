import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final colorThemeProvider = StateNotifierProvider<ColorThemeNotifier, ThemeMode>(
  (_) => ColorThemeNotifier(),
);

class ColorThemeNotifier extends StateNotifier<ThemeMode> {
  // TODO: Implement ThemeMode.system
  ColorThemeNotifier() : super(ThemeMode.light);

  void reset() => state = ThemeMode.system;
  void setLight() => state = ThemeMode.light;
  void setDark() => state = ThemeMode.dark;
  void toggle() =>
      state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}
