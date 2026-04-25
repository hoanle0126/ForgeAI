import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class NutritionDailyTargetLabel extends StatelessWidget {
  const NutritionDailyTargetLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.track_changes, color: AppColors.sportOrange, size: 14),
        const SizedBox(width: 6),
        Text(
          'DAILY TARGET',
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.sportOrange,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
