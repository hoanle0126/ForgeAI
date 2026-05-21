import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';

class WorkoutCreateNotifier extends StateNotifier<WorkoutCreateState> {
  WorkoutCreateNotifier(this._apiClient) : super(const WorkoutCreateState());

  final ApiClient _apiClient;

  Future<void> loadExercises() async {
    state = state.copyWith(isLoadingExercises: true, errorMessage: null);

    try {
      final response = await _apiClient.get<Map<String, dynamic>>('/exercises');

      if (response.data == null) {
        throw Exception('No data received from server');
      }

      final data = response.data!['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw Exception('Invalid response format');
      }

      final exercisesList = data['exercises'] as List<dynamic>? ?? [];

      final exercises = exercisesList
          .whereType<Map<String, dynamic>>()
          .map((json) => Exercise.fromJson(json))
          .toList();

      state = state.copyWith(
        availableExercises: exercises,
        isLoadingExercises: false,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoadingExercises: false,
        errorMessage: _readDioError(e, 'Failed to load exercises'),
      );
    } catch (_) {
      state = state.copyWith(
        isLoadingExercises: false,
        errorMessage: 'Failed to load exercises. Please try again.',
      );
    }
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title, errorMessage: null);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateDifficulty(WorkoutDifficulty? difficulty) {
    state = state.copyWith(difficulty: difficulty);
  }

  void updateGoal(WorkoutGoal? goal) {
    state = state.copyWith(goal: goal);
  }

  void updateScheduledFor(DateTime? scheduledFor) {
    state = state.copyWith(scheduledFor: scheduledFor);
  }

  void updateNotes(String notes) {
    state = state.copyWith(notes: notes);
  }

  void addExercise(Exercise exercise) {
    final newItem = WorkoutItem(
      exerciseId: exercise.id,
      exerciseName: exercise.name,
      order: state.items.length + 1,
      sets: [
        const WorkoutSet(order: 1, reps: 10),
        const WorkoutSet(order: 2, reps: 10),
        const WorkoutSet(order: 3, reps: 10),
      ],
    );

    state = state.copyWith(items: [...state.items, newItem]);
  }

  void cacheExercise(Exercise exercise) {
    final exercises = [
      exercise,
      ...state.availableExercises.where((item) => item.id != exercise.id),
    ];

    state = state.copyWith(availableExercises: exercises);
  }

  void addCreatedExercise(Exercise exercise) {
    cacheExercise(exercise);
    addExercise(exercise);
  }

  void removeExercise(int index) {
    final updatedItems = List<WorkoutItem>.from(state.items)..removeAt(index);
    final reorderedItems = updatedItems
        .asMap()
        .entries
        .map((entry) => entry.value.copyWith(order: entry.key + 1))
        .toList();

    state = state.copyWith(items: reorderedItems);
  }

  void updateExerciseSets(int itemIndex, List<WorkoutSet> sets) {
    final updatedItems = List<WorkoutItem>.from(state.items);
    updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(sets: sets);
    state = state.copyWith(items: updatedItems);
  }

  void addSetToExercise(int itemIndex) {
    final item = state.items[itemIndex];
    final newSet = WorkoutSet(
      order: item.sets.length + 1,
      reps: item.sets.isNotEmpty ? item.sets.last.reps : 10,
      weightKg: item.sets.isNotEmpty ? item.sets.last.weightKg : null,
    );

    final updatedSets = [...item.sets, newSet];
    updateExerciseSets(itemIndex, updatedSets);
  }

  void removeSetFromExercise(int itemIndex, int setIndex) {
    final item = state.items[itemIndex];
    final updatedSets = List<WorkoutSet>.from(item.sets)..removeAt(setIndex);
    final reorderedSets = updatedSets
        .asMap()
        .entries
        .map((entry) => entry.value.copyWith(order: entry.key + 1))
        .toList();

    updateExerciseSets(itemIndex, reorderedSets);
  }

  void updateSet(int itemIndex, int setIndex, WorkoutSet updatedSet) {
    final item = state.items[itemIndex];
    final updatedSets = List<WorkoutSet>.from(item.sets);
    updatedSets[setIndex] = updatedSet;
    updateExerciseSets(itemIndex, updatedSets);
  }

  Future<bool> saveWorkout() async {
    if (state.title.trim().isEmpty) {
      state = state.copyWith(errorMessage: 'Workout title is required');
      return false;
    }

    if (state.items.isEmpty) {
      state = state.copyWith(errorMessage: 'Add at least one exercise');
      return false;
    }

    state = state.copyWith(isSaving: true, errorMessage: null);

    try {
      final request = CreateWorkoutRequest(
        title: state.title,
        description: state.description.isEmpty ? null : state.description,
        isTemplate: state.isTemplate,
        scheduledFor: state.scheduledFor,
        durationMinutes: state.durationMinutes,
        difficulty: state.difficulty,
        goal: state.goal,
        status: state.status,
        notes: state.notes.isEmpty ? null : state.notes,
        items: state.items,
      );

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/workouts',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        state = state.copyWith(isSaving: false);
        return true;
      } else {
        throw Exception('Failed to save workout: ${response.statusCode}');
      }
    } on DioException catch (e) {
      state = state.copyWith(
        isSaving: false,
        errorMessage: _readDioError(e, 'Failed to save workout'),
      );
      return false;
    } catch (_) {
      state = state.copyWith(
        isSaving: false,
        errorMessage: 'Failed to save workout. Please try again.',
      );
      return false;
    }
  }

  void reset() {
    state = const WorkoutCreateState();
  }

  String _readDioError(DioException error, String fallback) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is List && message.isNotEmpty) {
        return '$fallback: ${message.first}';
      }
      if (message != null) return '$fallback: $message';
    }

    return '$fallback. Please try again.';
  }
}

final workoutCreateProvider =
    StateNotifierProvider<WorkoutCreateNotifier, WorkoutCreateState>((ref) {
      final apiClient = ref.watch(apiClientProvider);
      return WorkoutCreateNotifier(apiClient);
    });
