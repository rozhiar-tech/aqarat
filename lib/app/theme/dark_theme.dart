import 'package:aqarat/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: AppColors.greenColor,
    primary: AppColors.whiteColor,
    secondary: AppColors.goldColor,
    onPrimary: AppColors.goldColor.withOpacity(0.2),
  ),
);
