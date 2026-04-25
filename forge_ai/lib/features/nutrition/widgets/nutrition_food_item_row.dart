import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_food_item.dart';

class NutritionFoodItemRow extends StatefulWidget {
  const NutritionFoodItemRow({super.key, required this.item});

  final NutritionFoodItem item;

  @override
  State<NutritionFoodItemRow> createState() => _NutritionFoodItemRowState();
}

class _NutritionFoodItemRowState extends State<NutritionFoodItemRow> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final scale = _isPressed ? 0.98 : 1.0;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutQuad,
        transform: Matrix4.diagonal3Values(scale, scale, 1.0),
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
