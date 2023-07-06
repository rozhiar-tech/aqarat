import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: AppColors.greenColor,
    secondary: AppColors.goldColor,
    onPrimary: Colors.grey.withOpacity(0.2),
  ),
);
