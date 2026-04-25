import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_meal.dart';
import 'package:forge_ai/features/nutrition/widgets/nutrition_food_item_row.dart';

class NutritionMealGroup extends StatelessWidget {
  const NutritionMealGroup({super.key, required this.meal});
  final NutritionMeal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.inputBg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                meal.time,
                style: AppTypography.statSmall.copyWith(fontSize: 11),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                meal.label,
                style: AppTypography.h4.copyWith(fontSize: 18),
              ),
            ),
            Text(
              '${meal.calories} kcal',
              style: AppTypography.statSmall.copyWith(
                color: AppColors.sportOrange,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        for (var i = 0; i < meal.items.length; i++) ...[
          NutritionFoodItemRow(item: meal.items[i]),
          if (i != meal.items.length - 1) const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}
