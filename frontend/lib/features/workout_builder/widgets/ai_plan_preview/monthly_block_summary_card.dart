import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MonthlyBlockSummaryCard extends StatelessWidget {
  const MonthlyBlockSummaryCard({super.key, required this.plan});

  final AiMonthlyWorkoutPlan plan;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MONTH 1 SUMMARY',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.aiBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(plan.title, style: AppTypography.h3),
          const SizedBox(height: AppSpacing.sm),
          Text(
            plan.summary,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textDark.withValues(alpha: 0.84),
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _SummaryChip('${plan.blockLengthWeeks} weeks'),
              _SummaryChip(
                '${plan.selectedTrainingDays.length} sessions / week',
              ),
              _SummaryChip('Check-in ${plan.reassessment.dueAfterDays} days'),
              _SummaryChip(plan.preferredTimeLabel),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Training days',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.textDisabled,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            plan.trainingDaySummary,
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(plan.reassessment.promptTitle, style: AppTypography.h4),
          const SizedBox(height: AppSpacing.xs),
          Text(
            plan.reassessment.summary,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textMuted,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.sportOrangeLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        label,
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.sportOrange,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
