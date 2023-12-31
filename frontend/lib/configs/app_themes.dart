import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:otomo/configs/app_colors.dart';
import 'package:otomo/views/bases/forms/rounded_text_form_field.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:settings_ui/settings_ui.dart';

abstract class AppThemes {
  static final ThemeData _light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      background: Colors.white,
      onBackground: AppLightColors.onBackground,
      surface: AppLightColors.surface,
      onSurface: AppLightColors.onBackground,
      error: AppColors.error,
      onError: Colors.white,
      errorContainer: AppLightColors.hintColor,
      onErrorContainer: Colors.white,
      shadow: AppColors.shadow,
      scrim: AppColors.scrim,
      outline: AppLightColors.outline,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyles.bold,
      titleLarge: TextStyles.bold,
      titleMedium: TextStyles.bold,
    ),
    useMaterial3: true,
  );

  static final ThemeData light = _light.copyWith(
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppLightColors.inputFillColor,
      hintStyle: TextStyle(
        color: AppLightColors.hintColor,
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: _light.colorScheme.background,
      surfaceTintColor: _light.colorScheme.background,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _light.colorScheme.background,
      surfaceTintColor: _light.colorScheme.background,
      shadowColor: _light.colorScheme.shadow,
      titleTextStyle: _light.textTheme.titleLarge,
      elevation: 0.0,
      scrolledUnderElevation: 2.0,
      shape: Border(bottom: BorderSide(color: _light.dividerColor)),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _light.colorScheme.surface,
      closeIconColor: _light.colorScheme.onSurface,
      contentTextStyle: _light.textTheme.bodyMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
      showCloseIcon: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 3,
    ),
    extensions: <ThemeExtension>[
      AppTheme(
        dangerColor: AppColors.danger,
        activeColor: AppColors.activeGreen,
        photoGalleryBackground: AppColors.photoGalleryBackground,
        chatTheme: DefaultChatTheme(
          primaryColor: _light.colorScheme.primary,
          secondaryColor: _light.colorScheme.surfaceVariant,
          backgroundColor: _light.colorScheme.background,
          sendButtonIcon: Icon(
            Icons.send_rounded,
            color: _light.colorScheme.primary,
          ),
          inputTextStyle: _light.textTheme.bodyMedium!,
          inputTextColor: _light.textTheme.bodyMedium!.color!,
          inputBorderRadius: BorderRadius.zero,
          inputBackgroundColor: _light.colorScheme.background,
          inputContainerDecoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: _light.dividerColor),
            ),
          ),
          inputTextDecoration: RoundedTextFormField.defaultDecoration,
          messageBorderRadius: 16,
        ),
        settingsTheme: SettingsThemeData(
          settingsSectionBackground: _light.colorScheme.surfaceVariant,
          settingsListBackground: _light.colorScheme.background,
        ),
      )
    ],
  );

  // static final ThemeData oldLight = ThemeData(
  //   inputDecorationTheme: InputDecorationTheme(),
  //   textTheme: Typography.material2021(colorScheme: ColorScheme.light()).black,

  //   // Fixed
  //   useMaterial3: true,
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

class AppTheme extends ThemeExtension<AppTheme> {
  AppTheme({
    required this.chatTheme,
    required this.settingsTheme,
    required this.dangerColor,
    required this.activeColor,
    required this.photoGalleryBackground,
  });

  final ChatTheme chatTheme;
  final SettingsThemeData settingsTheme;

  final Color dangerColor;
  final Color activeColor;
  final Color photoGalleryBackground;

  @override
  ThemeExtension<AppTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    return this;
  }
}
