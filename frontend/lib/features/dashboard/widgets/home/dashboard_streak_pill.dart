import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class DashboardStreakPill extends StatelessWidget {
  const DashboardStreakPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.sportOrangeLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        children: [
          Text(
            '12',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.sportOrange,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Text('🔥', style: AppTypography.bodySmall.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}
