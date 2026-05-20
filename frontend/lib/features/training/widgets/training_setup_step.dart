import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class TrainingSetupStep extends StatelessWidget {
  const TrainingSetupStep({
    super.key,
    required this.label,
    required this.title,
    required this.description,
  });

  final String label;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.statSmall.copyWith(color: AppColors.energy),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.bodySemiBold.copyWith(
                  color: AppColors.cardWhite,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                description,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.cardWhite.withValues(alpha: 0.64),
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
