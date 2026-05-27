import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';

final trainingWorkoutProvider = FutureProvider.autoDispose<TrainingWorkoutPlan?>((
  ref,
) async {
  final workouts = await ref.watch(workoutLibraryProvider.future);
  for (final workout in workouts) {
    if (workout.status == TrainingWorkoutStatus.archived ||
        workout.items.isEmpty) {
      continue;
    }
    return workout.toTrainingPlan();
  }
  return null;
});
