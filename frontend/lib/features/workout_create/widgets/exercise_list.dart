import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_list_item.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_list_skeleton.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({
    super.key,
    required this.isLoading,
    required this.exercises,
    required this.onExerciseSelected,
  });

  final bool isLoading;
  final List<Exercise> exercises;
  final void Function(Exercise) onExerciseSelected;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const ExerciseListSkeleton();
    }

    if (exercises.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIcons.magnifyingGlass(),
                color: AppColors.textDisabled,
                size: AppSpacing.xxxl,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'No exercises found',
                style: AppTypography.bodySemiBold.copyWith(
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Try another search or create your own exercise.',
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: AppSpacing.screenPadding,
      itemCount: exercises.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return ExerciseListItem(
          exercise: exercise,
          onTap: () => onExerciseSelected(exercise),
        );
      },
    );
  }
}
