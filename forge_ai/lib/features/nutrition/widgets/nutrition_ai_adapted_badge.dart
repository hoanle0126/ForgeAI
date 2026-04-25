import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NutritionAiAdaptedBadge extends StatelessWidget {
  const NutritionAiAdaptedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.sportOrange, AppColors.sportOrangeLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSpacing.radiusMd),
        ),
      ),
      child: Text(
        'AI ADAPTED',
        style: AppTypography.labelUppercase.copyWith(
          color: AppColors.cardWhite,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
