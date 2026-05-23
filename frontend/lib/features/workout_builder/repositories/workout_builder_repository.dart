import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';

typedef MonthlyWorkoutPlanResult = ({
  AiMonthlyWorkoutPlan plan,
  List<Map<String, dynamic>> workoutTemplateDrafts,
});

class WorkoutBuilderRepository {
  const WorkoutBuilderRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<MonthlyWorkoutPlanResult> buildMonthlyPlan({
    required Map<String, dynamic> payload,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/ai/workout-builder/monthly-plan',
      data: payload,
    );

    final data = _readMap(response.data, 'data');
    final plan = _normalizeMonthlyPlan(_readMap(data, 'plan'));
    final templateDrafts = _readList(data, 'workoutTemplateDrafts');

    return (
      plan: AiMonthlyWorkoutPlan.fromJson(plan),
      workoutTemplateDrafts: templateDrafts
          .whereType<Map<String, dynamic>>()
          .map((draft) => Map<String, dynamic>.from(draft))
          .toList(growable: false),
    );
  }

  Future<void> updateWorkoutsFromMonthlyPlan({
    required List<Map<String, dynamic>> workoutTemplateDrafts,
  }) async {
    if (workoutTemplateDrafts.isEmpty) return;

    final existingTemplatesResponse = await _apiClient
        .get<Map<String, dynamic>>(
          '/workouts',
          queryParameters: {'isTemplate': 'true'},
        );
    final existingTemplates = _readList(
      existingTemplatesResponse.data,
      'workouts',
    );
    final existingTemplateIds = existingTemplates
        .whereType<Map<String, dynamic>>()
        .map((template) => template['id'])
        .whereType<String>()
        .toList(growable: false);

    for (final workout in workoutTemplateDrafts) {
      final sanitizedWorkout = _sanitizeWorkoutTemplateDraft(workout);
      await _apiClient.post<Map<String, dynamic>>(
        '/workouts',
        data: sanitizedWorkout,
      );
    }

    for (final templateId in existingTemplateIds) {
      await _apiClient.delete<void>('/workouts/$templateId');
    }
  }

  Map<String, dynamic> _readMap(Map<String, dynamic>? source, String key) {
    final value = source?[key];
    if (value is Map<String, dynamic>) {
      return value;
    }
    throw FormatException('Invalid monthly plan response: missing $key.');
  }

  List<dynamic> _readList(Map<String, dynamic>? source, String key) {
    final value = source?[key];
    if (value is List<dynamic>) {
      return value;
    }
    return const [];
  }

  Map<String, dynamic> _normalizeMonthlyPlan(Map<String, dynamic> plan) {
    final normalized = Map<String, dynamic>.from(plan);

    normalized['readinessAdjustment'] =
        _coerceMap(normalized['readinessAdjustment']) ??
        const {
          'intensityModifier': 'maintain',
          'reason': 'No readiness adjustment was provided.',
        };
    normalized['nutritionTargets'] = _normalizeNutritionTargets(
      _coerceMap(normalized['nutritionTargets']),
    );
    normalized['reassessment'] = _normalizeReassessment(
      _coerceMap(normalized['reassessment']),
    );

    return normalized;
  }

  Map<String, dynamic> _normalizeNutritionTargets(Map<String, dynamic>? value) {
    if (value == null) {
      return const {
        'dailyCalories': 0,
        'proteinTargetG': 0,
        'carbTargetG': 0,
        'fatTargetG': 0,
      };
    }

    return {
      'dailyCalories': _coerceInt(
        value['dailyCalories'] ?? value['daily_calories'],
      ),
      'proteinTargetG': _coerceInt(
        value['proteinTargetG'] ?? value['protein_target_g'],
      ),
      'carbTargetG': _coerceInt(value['carbTargetG'] ?? value['carb_target_g']),
      'fatTargetG': _coerceInt(value['fatTargetG'] ?? value['fat_target_g']),
    };
  }

  Map<String, dynamic> _normalizeReassessment(Map<String, dynamic>? value) {
    if (value == null) {
      return const {
        'dueAfterDays': 28,
        'promptTitle': 'Month-end training check-in',
        'summary': 'Review completion and recovery before next block.',
        'questions': <String>[],
      };
    }

    final questions = value['questions'];
    return {
      'dueAfterDays': _coerceInt(
        value['dueAfterDays'] ?? value['due_after_days'],
      ),
      'promptTitle':
          value['promptTitle'] ??
          value['prompt_title'] ??
          'Month-end training check-in',
      'summary':
          value['summary'] ??
          'Review completion and recovery before next block.',
      'questions': questions is List
          ? questions.whereType<String>().toList(growable: false)
          : const <String>[],
    };
  }

  Map<String, dynamic>? _coerceMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return null;
  }

  int _coerceInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.round();
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  Map<String, dynamic> _sanitizeWorkoutTemplateDraft(
    Map<String, dynamic> workout,
  ) {
    final sanitized = Map<String, dynamic>.from(workout);
    sanitized['title'] = _truncateString(sanitized['title'], 120);
    sanitized['description'] = _truncateString(sanitized['description'], 500);
    sanitized['notes'] = _truncateString(sanitized['notes'], 1000);

    final items = sanitized['items'];
    if (items is List) {
      sanitized['items'] = items
          .whereType<Map<Object?, Object?>>()
          .map(
            (item) => _sanitizeWorkoutItem(Map<String, dynamic>.from(item)),
          )
          .toList(growable: false);
    }

    return sanitized;
  }

  Map<String, dynamic> _sanitizeWorkoutItem(Map<String, dynamic> item) {
    final sanitized = Map<String, dynamic>.from(item);
    sanitized['exerciseId'] = _truncateString(sanitized['exerciseId'], 120);
    sanitized['exerciseName'] = _truncateString(sanitized['exerciseName'], 120);
    sanitized['notes'] = _truncateString(sanitized['notes'], 500);
    return sanitized;
  }

  String? _truncateString(dynamic value, int maxLength) {
    if (value is! String) {
      return null;
    }
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    if (trimmed.length <= maxLength) {
      return trimmed;
    }
    return trimmed.substring(0, maxLength);
  }
}
