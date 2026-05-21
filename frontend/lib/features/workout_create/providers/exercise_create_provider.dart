import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';

const exerciseMuscleGroupOptions = [
  'chest',
  'back',
  'legs',
  'shoulders',
  'arms',
  'core',
  'full_body',
];

const exerciseEquipmentOptions = [
  'bodyweight',
  'dumbbell',
  'barbell',
  'machine',
  'cable',
  'band',
  'kettlebell',
  'other',
];

const exerciseDifficultyOptions = ['beginner', 'intermediate', 'advanced'];
const exerciseVisibilityOptions = ['private', 'public'];

class ExerciseCreateNotifier extends StateNotifier<ExerciseCreateState> {
  ExerciseCreateNotifier(this._apiClient) : super(const ExerciseCreateState());

  final ApiClient _apiClient;

  void updateName(String value) {
    state = state.copyWith(name: value, errorMessage: null);
  }

  void updateDescription(String value) {
    state = state.copyWith(description: value);
  }

  void toggleMuscleGroup(String value) {
    final groups = [...state.muscleGroups];
    groups.contains(value) ? groups.remove(value) : groups.add(value);
    state = state.copyWith(muscleGroups: groups, errorMessage: null);
  }

  void updateEquipment(String value) {
    state = state.copyWith(equipment: value);
  }

  void updateDifficulty(String value) {
    state = state.copyWith(difficulty: value);
  }

  void updateInstructions(String value) {
    state = state.copyWith(instructionsText: value);
  }

  void updateSafetyNotes(String value) {
    state = state.copyWith(safetyNotesText: value);
  }

  void updateVideoUrl(String value) {
    state = state.copyWith(videoUrl: value, errorMessage: null);
  }

  void updateImageUrl(String value) {
    state = state.copyWith(imageUrl: value, errorMessage: null);
  }

  void updateVisibility(String value) {
    state = state.copyWith(visibility: value);
  }

  Future<Exercise?> saveExercise() async {
    final request = _buildRequest();
    if (request == null) return null;

    state = state.copyWith(isSaving: true, errorMessage: null);

    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/exercises',
        data: request.toJson(),
      );
      final data = response.data?['data'] as Map<String, dynamic>?;
      final exerciseJson = data?['exercise'] as Map<String, dynamic>?;
      if (exerciseJson == null) {
        throw const FormatException('Missing exercise payload');
      }

      state = state.copyWith(isSaving: false);
      return Exercise.fromJson(exerciseJson);
    } on DioException catch (e) {
      state = state.copyWith(isSaving: false, errorMessage: _readDioError(e));
      return null;
    } catch (_) {
      state = state.copyWith(
        isSaving: false,
        errorMessage: 'Failed to save exercise. Please try again.',
      );
      return null;
    }
  }

  void reset() {
    state = const ExerciseCreateState();
  }

  CreateExerciseRequest? _buildRequest() {
    final name = state.name.trim();
    if (name.isEmpty) {
      state = state.copyWith(errorMessage: 'Exercise name is required');
      return null;
    }

    if (state.muscleGroups.isEmpty) {
      state = state.copyWith(errorMessage: 'Pick at least one muscle group');
      return null;
    }

    final videoUrl = _cleanOptionalUrl(state.videoUrl, 'video URL');
    if (videoUrl == _invalidUrlSentinel) return null;

    final imageUrl = _cleanOptionalUrl(state.imageUrl, 'image URL');
    if (imageUrl == _invalidUrlSentinel) return null;

    return CreateExerciseRequest(
      name: name,
      description: _cleanOptionalText(state.description),
      muscleGroups: state.muscleGroups,
      equipment: state.equipment,
      difficulty: state.difficulty,
      instructions: _splitLines(state.instructionsText),
      safetyNotes: _splitLines(state.safetyNotesText),
      videoUrl: videoUrl,
      imageUrl: imageUrl,
      visibility: state.visibility,
    );
  }

  String? _cleanOptionalText(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  List<String> _splitLines(String value) {
    return value
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();
  }

  String? _cleanOptionalUrl(String value, String label) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;

    final uri = Uri.tryParse(trimmed);
    final isValid = uri != null && uri.hasScheme && uri.host.isNotEmpty;
    if (!isValid) {
      state = state.copyWith(errorMessage: 'Enter a valid $label');
      return _invalidUrlSentinel;
    }

    return trimmed;
  }

  String _readDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is List && message.isNotEmpty) {
        return message.first.toString();
      }
      if (message != null) return message.toString();
    }

    return 'Failed to save exercise. Please try again.';
  }
}

final exerciseCreateProvider =
    StateNotifierProvider<ExerciseCreateNotifier, ExerciseCreateState>((ref) {
      final apiClient = ref.watch(apiClientProvider);
      return ExerciseCreateNotifier(apiClient);
    });

const _invalidUrlSentinel = '__invalid_url__';
