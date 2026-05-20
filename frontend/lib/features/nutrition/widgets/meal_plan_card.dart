import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MealPlanCard extends StatelessWidget {
  const MealPlanCard({super.key});

  static const _meals = [
    _MealPlanItem('08:00', 'Protein oats', 'Greek yogurt, berries, oats'),
    _MealPlanItem('12:30', 'Chicken rice bowl', 'Lean protein, jasmine rice'),
    _MealPlanItem('17:30', 'Pre-workout snack', 'Banana, whey, electrolytes'),
    _MealPlanItem('20:30', 'Recovery dinner', 'Salmon, greens, sweet potato'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today\'s Meal Plan', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          for (final meal in _meals) ...[
            _MealRow(meal: meal),
            if (meal != _meals.last) const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

class _MealPlanItem {
  const _MealPlanItem(this.time, this.title, this.description);

  final String time;
  final String title;
  final String description;
}

class _MealRow extends StatelessWidget {
  const _MealRow({required this.meal});

  final _MealPlanItem meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSpacing.xxxl,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.inputBg,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Text(
            meal.time,
            textAlign: TextAlign.center,
            style: AppTypography.statSmall.copyWith(fontSize: 11),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meal.title, style: AppTypography.bodySemiBold),
              const SizedBox(height: AppSpacing.xs),
              Text(meal.description, style: AppTypography.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
