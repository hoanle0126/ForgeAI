import 'package:forge_ai/data/datasources/remote/api_client.dart';
import 'package:forge_ai/features/workout_builder/models/monthly_workout_plan.dart';

class WorkoutBuilderRepository {
  const WorkoutBuilderRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<AiMonthlyWorkoutPlan> buildMonthlyPlan({
    required Map<String, dynamic> payload,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/ai/workout-builder/monthly-plan',
      data: payload,
    );

    final data = response.data?['data'];
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Invalid monthly plan response.');
    }

    final plan = data['plan'];
    if (plan is! Map<String, dynamic>) {
      throw const FormatException('Monthly plan not found in response.');
    }

    return AiMonthlyWorkoutPlan.fromJson(plan);
  }
}
