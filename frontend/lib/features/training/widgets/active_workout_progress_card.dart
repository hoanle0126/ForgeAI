import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class ActiveWorkoutProgressCard extends StatelessWidget {
  const ActiveWorkoutProgressCard({super.key, required this.session});

  final ActiveWorkoutSessionState session;

  @override
  Widget build(BuildContext context) {
    final next = session.nextExercise?.name ?? 'Finish session';
    final progress =
        session.completedExerciseCount / session.plan.exercises.length;

    return AppCard(
      hasShadow: false,
      padding: const EdgeInsets.all(AppSpacing.base),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('PROGRESS', style: AppTypography.labelUppercase),
              const Spacer(),
              Text(
                '${(progress * 100).round()}%',
                style: AppTypography.statSmall.copyWith(
                  color: AppColors.sportOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: AppSpacing.sm,
              backgroundColor: AppColors.inputBg,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.sportOrange,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          _ProgressLine(label: 'Current', value: session.currentExercise.name),
          const SizedBox(height: AppSpacing.sm),
          _ProgressLine(label: 'Next', value: next),
          const SizedBox(height: AppSpacing.base),
          _ProgressLine(
            label: 'Completed',
            value:
                '${session.completedExerciseCount}/${session.plan.exercises.length} exercises',
          ),
        ],
      ),
    );
  }
}

class _ProgressLine extends StatelessWidget {
  const _ProgressLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 72,
          child: Text(label.toUpperCase(), style: AppTypography.label),
        ),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }
}
