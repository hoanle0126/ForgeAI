import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NutritionTargetSummaryRow extends StatelessWidget {
  const NutritionTargetSummaryRow({
    super.key,
    required this.target,
    required this.remaining,
  });

  final int target;
  final int remaining;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$target',
              style: AppTypography.statLarge.copyWith(
                color: AppColors.cardWhite,
                fontSize: 32,
              ),
            ),
            Text(
              'kcal • Maintenance',
              style: AppTypography.label.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${remaining > 0 ? remaining : 0}',
              style: AppTypography.statLarge.copyWith(
                color: AppColors.sportOrange,
                fontSize: 24,
              ),
            ),
            Text(
              'Remaining',
              style: AppTypography.label.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
