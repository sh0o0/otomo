import 'package:flutter/material.dart';
import 'package:otomo/constants/app_colors.dart';

abstract class AppThemes {
  static final ThemeData light = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBlack,
      selectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(
        size: 28,
        color: AppColors.lightBlack,
      ),
      unselectedItemColor: AppColors.lightBlack,
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: AppColors.white,
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBlack,
      selectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(
        size: 28,
        color: AppColors.lightBlack,
      ),
      unselectedItemColor: AppColors.lightBlack,
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: AppColors.white,
      ),
    ),
  );
}
