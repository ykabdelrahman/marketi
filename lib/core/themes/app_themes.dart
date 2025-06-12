import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'styles.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: Styles.enMedium20().copyWith(
        color: AppColors.darkBlue900,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.darkBlue900),
  );
}
