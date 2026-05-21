import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WelcomeFeaturePills extends StatelessWidget {
  const WelcomeFeaturePills({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      ('Adaptive Plans', PhosphorIconsRegular.calendar),
      ('AI Nutrition', PhosphorIconsRegular.forkKnife),
      ('Progress Tracking', PhosphorIconsRegular.chartLine),
    ];

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: features.map((feature) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(feature.$2, size: 18, color: AppColors.sportOrange),
              const SizedBox(width: AppSpacing.sm),
              Text(
                feature.$1,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
