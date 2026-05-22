import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/features/workout_builder/repositories/workout_builder_repository.dart';

final workoutBuilderRepositoryProvider = Provider<WorkoutBuilderRepository>((
  ref,
) {
  final apiClient = ref.watch(apiClientProvider);
  return WorkoutBuilderRepository(apiClient);
});

final monthlyWorkoutPlanProvider =
    FutureProvider.autoDispose<AiMonthlyWorkoutPlan>((ref) async {
      final repository = ref.watch(workoutBuilderRepositoryProvider);
      final payload = _buildMonthlyPlanPayload(ref);
      return repository.buildMonthlyPlan(payload: payload);
    });

String buildMonthlyWorkoutPlanErrorMessage(Object error) {
  if (error is FormatException) {
    return error.message.toString();
  }

  if (error is DioException) {
    final extractedMessage = _extractErrorMessage(error.response?.data);
    if (extractedMessage != null) {
      return extractedMessage;
    }

    final statusCode = error.response?.statusCode;
    if (statusCode == 404) {
      return 'Monthly plan endpoint not found. Update and restart backend API.';
    }

    if (error.message != null && error.message!.isNotEmpty) {
      return error.message!;
    }
  }

  final fallback = error.toString();
  if (fallback.isNotEmpty && fallback != 'Instance of Object') {
    return fallback;
  }

  return 'ForgeAI could not build your month 1 block yet.';
}

Map<String, dynamic> _buildMonthlyPlanPayload(Ref ref) {
  final goal = ref.watch(selectedWorkoutGoalProvider);
  final equipment = ref.watch(selectedEquipmentProvider);
  final activityLevel = ref.watch(activityLevelProvider);
  final preferredTime = ref.watch(preferredTimeProvider);
  final trainingDays = ref.watch(selectedDaysProvider).toList()
    ..sort((left, right) => left.index.compareTo(right.index));

  if (goal == null) {
    throw const FormatException('Choose a goal before building your plan.');
  }
  if (equipment.isEmpty) {
    throw const FormatException(
      'Choose at least one equipment option before continuing.',
    );
  }
  if (activityLevel == null) {
    throw const FormatException(
      'Choose your activity level before building your plan.',
    );
  }
  if (preferredTime == null) {
    throw const FormatException(
      'Choose a preferred training time before building your plan.',
    );
  }
  if (trainingDays.isEmpty) {
    throw const FormatException(
      'Pick at least one training day before building your plan.',
    );
  }

  return {
    'goal': goal.apiValue,
    'equipment': equipment.map((item) => item.apiValue).toList(growable: false),
    'heightCm': _parseDecimal(ref.watch(heightProvider), fieldLabel: 'height'),
    'weightKg': _parseDecimal(ref.watch(weightProvider), fieldLabel: 'weight'),
    'age': _parseInt(ref.watch(ageProvider), fieldLabel: 'age'),
    'activityLevel': activityLevel.apiValue,
    'trainingDays': trainingDays
        .map((item) => item.apiValue)
        .toList(growable: false),
    'sessionMinutes': ref.watch(sessionLengthProvider).round(),
    'preferredTime': preferredTime.apiValue,
  };
}

double _parseDecimal(String input, {required String fieldLabel}) {
  final match = RegExp(r'(\d+(?:\.\d+)?)').firstMatch(input);
  if (match == null) {
    throw FormatException('Enter a valid $fieldLabel before continuing.');
  }
  return double.parse(match.group(1)!);
}

int _parseInt(String input, {required String fieldLabel}) {
  final match = RegExp(r'(\d+)').firstMatch(input);
  if (match == null) {
    throw FormatException('Enter a valid $fieldLabel before continuing.');
  }
  return int.parse(match.group(1)!);
}

String? _extractErrorMessage(dynamic responseData) {
  if (responseData is! Map<String, dynamic>) {
    return null;
  }

  final message = responseData['message'];
  if (message is String && message.isNotEmpty) {
    return message;
  }

  if (message is List && message.isNotEmpty) {
    final first = message.first;
    if (first is String && first.isNotEmpty) {
      return first;
    }
  }

  final errors = responseData['errors'];
  if (errors is Map<String, dynamic> && errors.isNotEmpty) {
    final firstValue = errors.values.first;
    if (firstValue is List && firstValue.isNotEmpty) {
      final first = firstValue.first;
      if (first is String && first.isNotEmpty) {
        return first;
      }
    }
  }

  return null;
}
