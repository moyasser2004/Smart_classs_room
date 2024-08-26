import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
      ));
}
