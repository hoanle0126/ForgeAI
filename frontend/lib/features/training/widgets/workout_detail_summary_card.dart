import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/widgets/metric_pill.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class WorkoutDetailSummaryCard extends StatelessWidget {
  const WorkoutDetailSummaryCard({super.key, required this.workout});

  final WorkoutLibraryWorkout workout;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SAVED WORKOUT',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.energy,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            workout.title,
            style: AppTypography.h1.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            workout.description?.isNotEmpty == true
                ? workout.description!
                : 'Review the plan before you start the session.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.74),
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              MetricPill(label: workout.statusLabel),
              MetricPill(label: workout.durationLabel),
              MetricPill(label: workout.exerciseCountLabel),
              MetricPill(label: workout.scheduleLabel),
            ],
          ),
        ],
      ),
    );
  }
}
