import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class ScheduleAiPromo extends StatelessWidget {
  const ScheduleAiPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
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
                'MONTH 1 AI BLOCK',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '4 SESSIONS PER WEEK,\nTHEN A 28-DAY CHECK-IN.',
            style: AppTypography.h3.copyWith(
              color: AppColors.cardWhite,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'ForgeAI maps one full month first, then asks for new feedback before building the next block.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
