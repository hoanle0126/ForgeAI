import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TrainingStatisticsTopExercisesCard extends StatelessWidget {
  const TrainingStatisticsTopExercisesCard({
    super.key,
    required this.exercises,
  });

  final List<TrainingExerciseSpotlight> exercises;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top exercises', style: AppTypography.h4),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Repeated movement names across your active plans.',
            style: AppTypography.bodySmall,
          ),
          const SizedBox(height: AppSpacing.base),
          if (exercises.isEmpty)
            Text(
              'Add named exercises to surface density trends here.',
              style: AppTypography.bodySemiBold.copyWith(
                color: AppColors.textDark,
              ),
            )
          else
            for (final exercise in exercises.indexed) ...[
              _ExerciseRow(rank: exercise.$1 + 1, exercise: exercise.$2),
              if (exercise.$1 != exercises.length - 1)
                const SizedBox(height: AppSpacing.base),
            ],
        ],
      ),
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  const _ExerciseRow({required this.rank, required this.exercise});

  final int rank;
  final TrainingExerciseSpotlight exercise;

  @override
  Widget build(BuildContext context) {
    final repText = exercise.totalReps > 0
        ? ' · ${exercise.totalReps} reps'
        : '';

    return Row(
      children: [
        Container(
          width: AppSpacing.xxxl,
          height: AppSpacing.xxxl,
          decoration: BoxDecoration(
            color: AppColors.sportOrangeLight,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          ),
          child: Center(
            child: Text(
              '$rank',
              style: AppTypography.statSmall.copyWith(
                color: AppColors.sportOrange,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exercise.name, style: AppTypography.bodySemiBold),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '${exercise.workoutCount} plans · ${exercise.setCount} sets$repText',
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
