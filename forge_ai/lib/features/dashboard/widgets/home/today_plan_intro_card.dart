import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/widgets/home/today_plan_signals.dart';

class TodayPlanIntroCard extends StatelessWidget {
  const TodayPlanIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.base,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today\'s Plan', style: AppTypography.h2),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Adjusted for recovery',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.aiBlue,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const _TodayPlanMessage(),
          const SizedBox(height: AppSpacing.base),
          const TodayPlanSignals(),
        ],
      ),
    );
  }
}

class _TodayPlanMessage extends StatelessWidget {
  const _TodayPlanMessage();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 620),
      child: Text(
        'You slept a little less, so today\'s session is lighter to help you move well and stay consistent.',
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textMuted,
          height: 1.45,
        ),
      ),
    );
  }
}
