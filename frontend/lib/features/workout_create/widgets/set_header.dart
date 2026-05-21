import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class SetHeader extends StatelessWidget {
  const SetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSpacing.xl,
          child: Text(
            'SET',
            style: AppTypography.label.copyWith(color: AppColors.textDisabled),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            'REPS',
            style: AppTypography.label.copyWith(color: AppColors.textDisabled),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            'WEIGHT (KG)',
            style: AppTypography.label.copyWith(color: AppColors.textDisabled),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: AppSpacing.xxl),
      ],
    );
  }
}
