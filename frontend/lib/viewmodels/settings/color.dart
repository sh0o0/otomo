import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final colorThemeProvider = ChangeNotifierProvider((_) => ColorThemeViewModel());

class ColorThemeViewModel extends ChangeNotifier {
  ColorThemeViewModel();

  ThemeMode mode = ThemeMode.system;

  void reset() {
    mode = ThemeMode.system;
    notifyListeners();
  }

  void setLight() {
    mode = ThemeMode.light;
    notifyListeners();
  }

  void setDark() {
    mode = ThemeMode.dark;
    notifyListeners();
  }

  void toggle() {
    mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
