import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class ScheduleAiPromo extends StatelessWidget {
  const ScheduleAiPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.textDark,
            AppColors.textDark.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSpacing.sm,
                height: AppSpacing.sm,
                decoration: const BoxDecoration(
                  color: AppColors.sportOrange,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'PRECISION AI SYNC',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'OPTIMIZE YOUR\nPERFORMANCE WINDOW',
            style: AppTypography.h3.copyWith(
              color: AppColors.cardWhite,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
