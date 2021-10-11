import 'package:flutter/material.dart';
import 'colors.dart';

/// Custom themes for the app
class CustomTheme {

  /// Dark theme used by the app
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      bottomAppBarColor: AppColors.primary,
      primaryColorDark: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
    );
  }

  /// Light theme used by the app
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black, // appbar text color
      ),
      brightness: Brightness.light,
      primaryColor: Colors.white,
      bottomAppBarColor: AppColors.primary,
      primaryColorDark: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
    );
  }
}
