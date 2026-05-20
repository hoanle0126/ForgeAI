import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';

final trainingWorkoutProvider = FutureProvider<TrainingWorkoutPlan?>((
  ref,
) async {
  try {
    final tokenStorage = ref.watch(tokenStorageProvider);
    final apiClient = ApiClient(tokenStorage);
    final response = await apiClient.dio.get<Map<String, dynamic>>('/workouts');
    final workouts =
        response.data?['data']?['workouts'] as List<dynamic>? ?? const [];
    final firstWorkout = workouts.whereType<Map<String, dynamic>>().firstOrNull;
    if (firstWorkout == null) return null;
    return TrainingWorkoutPlan.fromWorkoutJson(firstWorkout);
  } catch (error) {
    debugPrint('Training workout load failed: $error');
    rethrow;
  }
});
