import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_workout_plan.freezed.dart';
part 'monthly_workout_plan.g.dart';

@freezed
class AiMonthlyWorkoutPlan with _$AiMonthlyWorkoutPlan {
  const AiMonthlyWorkoutPlan._();

  const factory AiMonthlyWorkoutPlan({
    required String title,
    required String goal,
    required String modelGoal,
    required String modelVersion,
    required int blockLengthWeeks,
    @Default([]) List<String> selectedTrainingDays,
    required String preferredTime,
    required String preferredTimeLabel,
    required String summary,
    @Default([]) List<String> safetyNotes,
    @Default([]) List<String> coachNotes,
    required AiReadinessAdjustment readinessAdjustment,
    required AiNutritionTargets nutritionTargets,
    @Default([]) List<AiTemplateWorkout> templateWorkouts,
    @Default([]) List<AiMonthlyPlanWeek> weeks,
    required AiReassessment reassessment,
  }) = _AiMonthlyWorkoutPlan;

  factory AiMonthlyWorkoutPlan.fromJson(Map<String, dynamic> json) =>
      _$AiMonthlyWorkoutPlanFromJson(json);

  String get trainingDaySummary =>
      selectedTrainingDays.map(_trainingDayLabelFromCode).join(' • ');
}

@freezed
class AiReadinessAdjustment with _$AiReadinessAdjustment {
  const factory AiReadinessAdjustment({
    required String intensityModifier,
    required String reason,
  }) = _AiReadinessAdjustment;

  factory AiReadinessAdjustment.fromJson(Map<String, dynamic> json) {
    final normalized = <String, dynamic>{...json};
    normalized['intensityModifier'] ??= json['intensity_modifier'];
    return _$AiReadinessAdjustmentFromJson(normalized);
  }
}

@freezed
class AiNutritionTargets with _$AiNutritionTargets {
  const factory AiNutritionTargets({
    required int dailyCalories,
    required int proteinTargetG,
    required int carbTargetG,
    required int fatTargetG,
  }) = _AiNutritionTargets;

  factory AiNutritionTargets.fromJson(Map<String, dynamic> json) =>
      _$AiNutritionTargetsFromJson(json);
}

@freezed
class AiTemplateWorkout with _$AiTemplateWorkout {
  const factory AiTemplateWorkout({
    required String templateId,
    required String title,
    required String focus,
    required int estimatedMinutes,
    required String warmUp,
    required String cooldown,
    @Default([]) List<AiTemplateExercise> exercises,
  }) = _AiTemplateWorkout;

  factory AiTemplateWorkout.fromJson(Map<String, dynamic> json) =>
      _$AiTemplateWorkoutFromJson(json);
}

@freezed
class AiTemplateExercise with _$AiTemplateExercise {
  const factory AiTemplateExercise({
    required int order,
    required String title,
    required String bodyPart,
    required String equipment,
    required String level,
    required String type,
    required String description,
    required int sets,
    required String reps,
    required int restSeconds,
    required String prescriptionLabel,
    required String rationale,
  }) = _AiTemplateExercise;

  factory AiTemplateExercise.fromJson(Map<String, dynamic> json) =>
      _$AiTemplateExerciseFromJson(json);
}

@freezed
class AiMonthlyPlanWeek with _$AiMonthlyPlanWeek {
  const factory AiMonthlyPlanWeek({
    required int weekNumber,
    required double loadMultiplier,
    required int targetSets,
    required bool isDeload,
    required String progressionRule,
    required String focus,
    @Default([]) List<AiMonthlyPlanDay> days,
  }) = _AiMonthlyPlanWeek;

  factory AiMonthlyPlanWeek.fromJson(Map<String, dynamic> json) =>
      _$AiMonthlyPlanWeekFromJson(json);
}

@freezed
class AiMonthlyPlanDay with _$AiMonthlyPlanDay {
  const factory AiMonthlyPlanDay({
    required String dayCode,
    required String dayLabel,
    required String type,
    String? preferredTime,
    String? preferredTimeLabel,
    String? templateId,
    String? templateTitle,
    required String focus,
    @Default([]) List<String> exercises,
    int? estimatedMinutes,
    String? mobility,
    String? warmUp,
    String? cooldown,
    double? loadMultiplier,
    int? targetSets,
    bool? isDeload,
  }) = _AiMonthlyPlanDay;

  factory AiMonthlyPlanDay.fromJson(Map<String, dynamic> json) =>
      _$AiMonthlyPlanDayFromJson(json);
}

@freezed
class AiReassessment with _$AiReassessment {
  const factory AiReassessment({
    required int dueAfterDays,
    required String promptTitle,
    required String summary,
    @Default([]) List<String> questions,
  }) = _AiReassessment;

  factory AiReassessment.fromJson(Map<String, dynamic> json) =>
      _$AiReassessmentFromJson(json);
}

String _trainingDayLabelFromCode(String code) {
  return switch (code) {
    'mo' => 'Monday',
    'tu' => 'Tuesday',
    'we' => 'Wednesday',
    'th' => 'Thursday',
    'fr' => 'Friday',
    'sa' => 'Saturday',
    'su' => 'Sunday',
    _ => code.toUpperCase(),
  };
}
