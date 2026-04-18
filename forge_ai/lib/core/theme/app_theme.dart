import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.warmIvory,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.sportOrange,
    primary: AppColors.sportOrange,
    surface: AppColors.cardWhite,
  ),
  textTheme: TextTheme(
    displayLarge: AppTypography.h1,
    displayMedium: AppTypography.h2,
    displaySmall: AppTypography.h3,
    headlineMedium: AppTypography.h4,
    bodyLarge: AppTypography.bodyLarge,
    bodyMedium: AppTypography.bodyMedium,
    bodySmall: AppTypography.bodySmall,
    labelLarge: AppTypography.labelUppercase,
    labelSmall: AppTypography.label,
  ),
);
