import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/repositories/workout_library_repository.dart';

final workoutLibraryRepositoryProvider = Provider<WorkoutLibraryRepository>((
  ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return WorkoutLibraryRepository(apiClient);
});

final workoutLibraryProvider = FutureProvider<List<WorkoutLibraryWorkout>>((
  ref,
) {
  final repository = ref.watch(workoutLibraryRepositoryProvider);
  return repository.listWorkouts();
});

final workoutDetailProvider =
    FutureProvider.family<WorkoutLibraryWorkout, String>((ref, workoutId) {
      final repository = ref.watch(workoutLibraryRepositoryProvider);
      return repository.getWorkout(workoutId);
    });
