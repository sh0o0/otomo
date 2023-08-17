import 'package:flutter/material.dart';
import 'package:otomo/constants/app_colors.dart';

abstract class AppThemes {
  static final ThemeData light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      background: Colors.white,
      onBackground: Color(0xFF272729),
    ),
    useMaterial3: true,
  ).copyWith(
    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: AppColors.primary,
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFFE9E9EA),
      hintStyle: TextStyle(
        color: Color(0xFFB5B5B8),
      ),
    ),
  );

  // static final ThemeData oldLight = ThemeData(
  //   inputDecorationTheme: InputDecorationTheme(),
  //   textTheme: Typography.material2021(colorScheme: ColorScheme.light()).black,

  //   // Fixed
  //   useMaterial3: true,
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     backgroundColor: AppColors.lightBlack,
  //     selectedItemColor: AppColors.white,
  //     selectedIconTheme: IconThemeData(
  //       size: 28,
  //       color: AppColors.lightBlack,
  //     ),
  //     unselectedItemColor: AppColors.lightBlack,
  //     unselectedIconTheme: IconThemeData(
  //       size: 28,
  //       color: AppColors.white,
  //     ),
  //   ),
  // );
  static final ThemeData dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(),
    useMaterial3: true,
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.lightBlack,
    //   selectedItemColor: AppColors.white,
    //   selectedIconTheme: IconThemeData(
    //     size: 28,
    //     color: AppColors.lightBlack,
    //   ),
    //   unselectedItemColor: AppColors.lightBlack,
    //   unselectedIconTheme: IconThemeData(
    //     size: 28,
    //     color: AppColors.white,
    //   ),
    // ),
  );
}
