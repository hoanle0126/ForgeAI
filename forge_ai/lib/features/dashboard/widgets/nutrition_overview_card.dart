import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/widgets/nutrition_macro_row.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class NutritionOverviewCard extends StatelessWidget {
  const NutritionOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Fuel',
                style: AppTypography.h3.copyWith(fontSize: 16),
              ),
              Text(
                'Details',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.sportOrange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          const Row(
            children: [
              _CaloriesCircle(),
              SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  children: [
                    NutritionMacroRow(
                      label: 'Protein',
                      value: '140g',
                      percent: 0.8,
                      color: AppColors.aiBlue,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    NutritionMacroRow(
                      label: 'Carbs',
                      value: '220g',
                      percent: 0.6,
                      color: AppColors.energy,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    NutritionMacroRow(
                      label: 'Fat',
                      value: '60g',
                      percent: 0.4,
                      color: AppColors.recovery,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CaloriesCircle extends StatelessWidget {
  const _CaloriesCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.sportOrange, width: 4),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1.8k', style: AppTypography.statSmall),
            Text(
              'kcal',
              style: AppTypography.labelUppercase.copyWith(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
