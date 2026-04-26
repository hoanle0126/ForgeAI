import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_day_plan.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class NutritionAdjustmentContextCard extends StatelessWidget {
  const NutritionAdjustmentContextCard({super.key, required this.day});

  final NutritionDayPlan day;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CURRENT TARGET', style: AppTypography.labelUppercase),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _MetricPill('${day.totalCalories} kcal'),
              _MetricPill('${day.proteinGrams}g protein'),
              _MetricPill('${day.carbsGrams}g carbs'),
              _MetricPill('${day.meals.length} meals'),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Text(text, style: AppTypography.statSmall),
      ),
    );
  }
}
