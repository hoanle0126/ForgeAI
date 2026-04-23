import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_food_item.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_meal.dart';

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
          _FoodItemRow(item: meal.items[i]),
          if (i != meal.items.length - 1) const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _FoodItemRow extends StatefulWidget {
  const _FoodItemRow({required this.item});
  final NutritionFoodItem item;
  @override
  State<_FoodItemRow> createState() => _FoodItemRowState();
}

class _FoodItemRowState extends State<_FoodItemRow> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final s = _isPressed ? 0.98 : 1.0;
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutQuad,
        transform: Matrix4.diagonal3Values(s, s, 1.0),
        transformAlignment: Alignment.center,
        padding: const EdgeInsets.all(AppSpacing.base),
        decoration: BoxDecoration(
          color: _isPressed ? AppColors.sportOrangeLight : AppColors.cardWhite,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: Border.all(
            color: _isPressed
                ? AppColors.sportOrangeLight
                : AppColors.transparent,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.inputBg,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              alignment: Alignment.center,
              child: Text('🥣', style: AppTypography.h2),
            ),
            const SizedBox(width: AppSpacing.base),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: AppTypography.bodySemiBold.copyWith(
                      fontSize: 15,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(widget.item.detail, style: AppTypography.bodySmall),
                ],
              ),
            ),
            Text(
              '${widget.item.calories} kcal',
              style: AppTypography.statSmall.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
