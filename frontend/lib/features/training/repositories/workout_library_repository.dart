import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';

class WorkoutLibraryRepository {
  const WorkoutLibraryRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<List<WorkoutLibraryWorkout>> listWorkouts({
    TrainingWorkoutStatus? status,
    bool? isTemplate,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/workouts',
      queryParameters: {
        if (status != null) 'status': status.name,
        if (isTemplate != null) 'isTemplate': isTemplate.toString(),
      },
    );

    final workoutsJson = _readList(response.data, 'workouts');
    return workoutsJson
        .whereType<Map<String, dynamic>>()
        .map(WorkoutLibraryWorkout.fromJson)
        .toList(growable: false);
  }

  Future<WorkoutLibraryWorkout> getWorkout(String id) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/workouts/$id',
    );
    final workoutJson = _readMap(response.data, 'workout');
    return WorkoutLibraryWorkout.fromJson(workoutJson);
  }

  Future<void> deleteWorkout(String id) async {
    await _apiClient.delete<void>('/workouts/$id');
  }

  Future<void> completeWorkoutItem({
    required String workoutId,
    required String workoutItemId,
  }) async {
    await _apiClient.patch<void>(
      '/workouts/$workoutId/items/$workoutItemId/complete',
    );
  }

  List<dynamic> _readList(Map<String, dynamic>? response, String key) {
    final data = response?['data'];
    if (data is! Map<String, dynamic>) return const [];

    final value = data[key];
    return value is List<dynamic> ? value : const [];
  }

  Map<String, dynamic> _readMap(Map<String, dynamic>? response, String key) {
    final data = response?['data'];
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Invalid workout response.');
    }

    final value = data[key];
    if (value is Map<String, dynamic>) return value;
    throw const FormatException('Workout not found in response.');
  }
}
