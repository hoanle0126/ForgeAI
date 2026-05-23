import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:go_router/go_router.dart';

Future<void> handleWorkoutDelete({
  required BuildContext context,
  required WidgetRef ref,
  required WorkoutLibraryWorkout workout,
}) async {
  final shouldDelete = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete workout?', style: AppTypography.h4),
      content: Text(
        'This removes the workout from your library. You can\'t undo it.',
        style: AppTypography.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancel', style: AppTypography.bodySemiBold),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: TextButton.styleFrom(foregroundColor: AppColors.sportOrange),
          child: Text(
            'Delete',
            style: AppTypography.bodySemiBold.copyWith(
              color: AppColors.sportOrange,
            ),
          ),
        ),
      ],
    ),
  );
  if (shouldDelete != true || !context.mounted) return;

  final messenger = ScaffoldMessenger.of(context);
  try {
    await ref.read(workoutLibraryRepositoryProvider).deleteWorkout(workout.id);
    ref
      ..invalidate(workoutLibraryProvider)
      ..invalidate(trainingWorkoutProvider)
      ..invalidate(workoutDetailProvider(workout.id));

    if (!context.mounted) return;
    context.pop();
    messenger.showSnackBar(
      const SnackBar(content: Text('Workout deleted successfully')),
    );
  } catch (error, stackTrace) {
    debugPrint('Failed to delete workout: $error\n$stackTrace');
    if (!context.mounted) return;
    messenger.showSnackBar(
      const SnackBar(
        content: Text('Failed to delete workout'),
        backgroundColor: AppColors.sportOrange,
      ),
    );
  }
}
