import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/exercise_selector_sheet.dart';
import 'package:forge_ai/features/workout_create/widgets/exercises_section.dart';
import 'package:forge_ai/features/workout_create/widgets/workout_form_field.dart';
import 'package:forge_ai/features/workout_create/widgets/workout_metadata_section.dart';

class WorkoutCreateForm extends StatelessWidget {
  const WorkoutCreateForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.notesController,
    required this.state,
    required this.onDifficultyChanged,
    required this.onGoalChanged,
    required this.onScheduledForChanged,
    required this.onRemoveExercise,
    required this.onAddSet,
    required this.onRemoveSet,
    required this.onUpdateSet,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController notesController;
  final WorkoutCreateState state;
  final void Function(WorkoutDifficulty?) onDifficultyChanged;
  final void Function(WorkoutGoal?) onGoalChanged;
  final void Function(DateTime?) onScheduledForChanged;
  final void Function(int) onRemoveExercise;
  final void Function(int) onAddSet;
  final void Function(int, int) onRemoveSet;
  final void Function(int, int, WorkoutSet) onUpdateSet;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.base),
          WorkoutFormField(
            label: 'WORKOUT TITLE',
            hint: 'e.g., Upper Body Strength',
            controller: titleController,
            errorText: state.errorMessage?.contains('title') == true
                ? state.errorMessage
                : null,
          ),
          const SizedBox(height: AppSpacing.base),
          WorkoutFormField(
            label: 'DESCRIPTION (OPTIONAL)',
            hint: 'Add workout description...',
            controller: descriptionController,
            maxLines: 3,
          ),
          const SizedBox(height: AppSpacing.base),
          WorkoutMetadataSection(
            difficulty: state.difficulty,
            goal: state.goal,
            scheduledFor: state.scheduledFor,
            onDifficultyChanged: onDifficultyChanged,
            onGoalChanged: onGoalChanged,
            onScheduledForChanged: onScheduledForChanged,
          ),
          const SizedBox(height: AppSpacing.lg),
          ExercisesSection(
            items: state.items,
            onAddExercise: () => ExerciseSelectorSheet.show(context),
            onRemoveExercise: onRemoveExercise,
            onAddSet: onAddSet,
            onRemoveSet: onRemoveSet,
            onUpdateSet: onUpdateSet,
          ),
          const SizedBox(height: AppSpacing.base),
          WorkoutFormField(
            label: 'NOTES (OPTIONAL)',
            hint: 'Add any additional notes...',
            controller: notesController,
            maxLines: 3,
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}
