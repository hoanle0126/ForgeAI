import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutExerciseChecklist extends StatelessWidget {
  const WorkoutExerciseChecklist({super.key, required this.exercises});

  final List<TrainingExercise> exercises;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Exercise Checklist', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          for (final indexedExercise in exercises.indexed) ...[
            _ExerciseChecklistRow(
              index: indexedExercise.$1 + 1,
              exercise: indexedExercise.$2,
            ),
            if (indexedExercise.$1 != exercises.length - 1)
              const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

class _ExerciseChecklistRow extends StatelessWidget {
  const _ExerciseChecklistRow({required this.index, required this.exercise});

  final int index;
  final TrainingExercise exercise;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSpacing.base,
          backgroundColor: AppColors.inputBg,
          child: Text('$index', style: AppTypography.statSmall),
        ),
        const SizedBox(width: AppSpacing.md),
        Icon(_modeIcon, color: AppColors.sportOrange, size: 20),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exercise.name, style: AppTypography.bodySemiBold),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '${exercise.muscleLabel} · ${exercise.equipmentLabel}',
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(exercise.targetLabel, style: AppTypography.statSmall),
      ],
    );
  }

  IconData get _modeIcon {
    return switch (exercise.mode) {
      WorkoutExerciseMode.timed => PhosphorIcons.timer(PhosphorIconsStyle.bold),
      WorkoutExerciseMode.reps => PhosphorIcons.repeat(PhosphorIconsStyle.bold),
    };
  }
}
