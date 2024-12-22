import 'package:flutter/material.dart';
import 'color.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.cardColorLight,
    cardColor: AppColor.cardColorLight,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primaryLight,
      onPrimary: AppColor.onPrimaryLight,
      secondary: AppColor.secondaryLight,
      onSecondary: AppColor.onSecondaryLight,
      error: AppColor.errorLight,
      onError: AppColor.onErrorLight,
      surface: AppColor.surfaceLight,
      onSurface: AppColor.onSurfaceLight,
    ),
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.scaffoldBackgroundLight,
      foregroundColor: AppColor.textPrimaryColorDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.cardColorDark,
    cardColor: AppColor.cardColorDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColor.primaryDark,
      onPrimary: AppColor.onPrimaryDark,
      secondary: AppColor.secondaryDark,
      onSecondary: AppColor.onSecondaryDark,
      error: AppColor.errorDark,
      onError: AppColor.onErrorDark,
      surface: AppColor.surfaceDark,
      onSurface: AppColor.onSurfaceDark,
    ),
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.scaffoldBackgroundDark,
      foregroundColor: AppColor.textPrimaryColorLight,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}
