import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/workout_create/providers/workout_create_provider.dart';
import 'package:go_router/go_router.dart';

Future<void> handleWorkoutSave({
  required BuildContext context,
  required WidgetRef ref,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required TextEditingController notesController,
}) async {
  final notifier = ref.read(workoutCreateProvider.notifier)
    ..updateTitle(titleController.text)
    ..updateDescription(descriptionController.text)
    ..updateNotes(notesController.text);

  final success = await notifier.saveWorkout();
  if (!context.mounted) return;

  final state = ref.read(workoutCreateProvider);
  final isEditing = state.editingWorkoutId != null;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        success
            ? isEditing
                  ? 'Workout updated successfully'
                  : 'Workout saved successfully'
            : state.errorMessage ??
                  (isEditing
                      ? 'Failed to update workout'
                      : 'Failed to save workout'),
      ),
      backgroundColor: success ? AppColors.success : AppColors.sportOrange,
    ),
  );

  if (!success) return;

  ref
    ..invalidate(workoutLibraryProvider)
    ..invalidate(trainingWorkoutProvider);
  if (state.editingWorkoutId case final workoutId?) {
    ref.invalidate(workoutDetailProvider(workoutId));
  }
  context.pop();
}
