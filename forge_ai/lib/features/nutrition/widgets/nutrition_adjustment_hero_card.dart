import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_day_plan.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NutritionAdjustmentHeroCard extends StatelessWidget {
  const NutritionAdjustmentHeroCard({super.key, required this.day});

  final NutritionDayPlan day;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                color: AppColors.aiBlue,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'AI PROTOCOL',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite.withValues(alpha: 0.72),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            day.strategyTitle,
            style: AppTypography.h2.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            day.strategySummary,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
