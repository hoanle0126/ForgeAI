// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiMonthlyWorkoutPlanImpl _$$AiMonthlyWorkoutPlanImplFromJson(
        Map<String, dynamic> json) =>
    _$AiMonthlyWorkoutPlanImpl(
      title: json['title'] as String,
      goal: json['goal'] as String,
      modelGoal: json['modelGoal'] as String,
      modelVersion: json['modelVersion'] as String,
      blockLengthWeeks: (json['blockLengthWeeks'] as num).toInt(),
      selectedTrainingDays: (json['selectedTrainingDays'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredTime: json['preferredTime'] as String,
      preferredTimeLabel: json['preferredTimeLabel'] as String,
      summary: json['summary'] as String,
      safetyNotes: (json['safetyNotes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coachNotes: (json['coachNotes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      readinessAdjustment: AiReadinessAdjustment.fromJson(
          json['readinessAdjustment'] as Map<String, dynamic>),
      nutritionTargets: AiNutritionTargets.fromJson(
          json['nutritionTargets'] as Map<String, dynamic>),
      templateWorkouts: (json['templateWorkouts'] as List<dynamic>?)
              ?.map(
                  (e) => AiTemplateWorkout.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeks: (json['weeks'] as List<dynamic>?)
              ?.map(
                  (e) => AiMonthlyPlanWeek.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reassessment:
          AiReassessment.fromJson(json['reassessment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AiMonthlyWorkoutPlanImplToJson(
        _$AiMonthlyWorkoutPlanImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'goal': instance.goal,
      'modelGoal': instance.modelGoal,
      'modelVersion': instance.modelVersion,
      'blockLengthWeeks': instance.blockLengthWeeks,
      'selectedTrainingDays': instance.selectedTrainingDays,
      'preferredTime': instance.preferredTime,
      'preferredTimeLabel': instance.preferredTimeLabel,
      'summary': instance.summary,
      'safetyNotes': instance.safetyNotes,
      'coachNotes': instance.coachNotes,
      'readinessAdjustment': instance.readinessAdjustment,
      'nutritionTargets': instance.nutritionTargets,
      'templateWorkouts': instance.templateWorkouts,
      'weeks': instance.weeks,
      'reassessment': instance.reassessment,
    };

_$AiReadinessAdjustmentImpl _$$AiReadinessAdjustmentImplFromJson(
        Map<String, dynamic> json) =>
    _$AiReadinessAdjustmentImpl(
      intensityModifier: json['intensityModifier'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$AiReadinessAdjustmentImplToJson(
        _$AiReadinessAdjustmentImpl instance) =>
    <String, dynamic>{
      'intensityModifier': instance.intensityModifier,
      'reason': instance.reason,
    };

_$AiNutritionTargetsImpl _$$AiNutritionTargetsImplFromJson(
        Map<String, dynamic> json) =>
    _$AiNutritionTargetsImpl(
      dailyCalories: (json['dailyCalories'] as num).toInt(),
      proteinTargetG: (json['proteinTargetG'] as num).toInt(),
      carbTargetG: (json['carbTargetG'] as num).toInt(),
      fatTargetG: (json['fatTargetG'] as num).toInt(),
    );

Map<String, dynamic> _$$AiNutritionTargetsImplToJson(
        _$AiNutritionTargetsImpl instance) =>
    <String, dynamic>{
      'dailyCalories': instance.dailyCalories,
      'proteinTargetG': instance.proteinTargetG,
      'carbTargetG': instance.carbTargetG,
      'fatTargetG': instance.fatTargetG,
    };

_$AiTemplateWorkoutImpl _$$AiTemplateWorkoutImplFromJson(
        Map<String, dynamic> json) =>
    _$AiTemplateWorkoutImpl(
      templateId: json['templateId'] as String,
      title: json['title'] as String,
      focus: json['focus'] as String,
      estimatedMinutes: (json['estimatedMinutes'] as num).toInt(),
      warmUp: json['warmUp'] as String,
      cooldown: json['cooldown'] as String,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map(
                  (e) => AiTemplateExercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AiTemplateWorkoutImplToJson(
        _$AiTemplateWorkoutImpl instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'title': instance.title,
      'focus': instance.focus,
      'estimatedMinutes': instance.estimatedMinutes,
      'warmUp': instance.warmUp,
      'cooldown': instance.cooldown,
      'exercises': instance.exercises,
    };

_$AiTemplateExerciseImpl _$$AiTemplateExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$AiTemplateExerciseImpl(
      order: (json['order'] as num).toInt(),
      title: json['title'] as String,
      bodyPart: json['bodyPart'] as String,
      equipment: json['equipment'] as String,
      level: json['level'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      sets: (json['sets'] as num).toInt(),
      reps: json['reps'] as String,
      restSeconds: (json['restSeconds'] as num).toInt(),
      prescriptionLabel: json['prescriptionLabel'] as String,
      rationale: json['rationale'] as String,
    );

Map<String, dynamic> _$$AiTemplateExerciseImplToJson(
        _$AiTemplateExerciseImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'title': instance.title,
      'bodyPart': instance.bodyPart,
      'equipment': instance.equipment,
      'level': instance.level,
      'type': instance.type,
      'description': instance.description,
      'sets': instance.sets,
      'reps': instance.reps,
      'restSeconds': instance.restSeconds,
      'prescriptionLabel': instance.prescriptionLabel,
      'rationale': instance.rationale,
    };

_$AiMonthlyPlanWeekImpl _$$AiMonthlyPlanWeekImplFromJson(
        Map<String, dynamic> json) =>
    _$AiMonthlyPlanWeekImpl(
      weekNumber: (json['weekNumber'] as num).toInt(),
      loadMultiplier: (json['loadMultiplier'] as num).toDouble(),
      targetSets: (json['targetSets'] as num).toInt(),
      isDeload: json['isDeload'] as bool,
      progressionRule: json['progressionRule'] as String,
      focus: json['focus'] as String,
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => AiMonthlyPlanDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AiMonthlyPlanWeekImplToJson(
        _$AiMonthlyPlanWeekImpl instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'loadMultiplier': instance.loadMultiplier,
      'targetSets': instance.targetSets,
      'isDeload': instance.isDeload,
      'progressionRule': instance.progressionRule,
      'focus': instance.focus,
      'days': instance.days,
    };

_$AiMonthlyPlanDayImpl _$$AiMonthlyPlanDayImplFromJson(
        Map<String, dynamic> json) =>
    _$AiMonthlyPlanDayImpl(
      dayCode: json['dayCode'] as String,
      dayLabel: json['dayLabel'] as String,
      type: json['type'] as String,
      preferredTime: json['preferredTime'] as String?,
      preferredTimeLabel: json['preferredTimeLabel'] as String?,
      templateId: json['templateId'] as String?,
      templateTitle: json['templateTitle'] as String?,
      focus: json['focus'] as String,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt(),
      mobility: json['mobility'] as String?,
      warmUp: json['warmUp'] as String?,
      cooldown: json['cooldown'] as String?,
      loadMultiplier: (json['loadMultiplier'] as num?)?.toDouble(),
      targetSets: (json['targetSets'] as num?)?.toInt(),
      isDeload: json['isDeload'] as bool?,
    );

Map<String, dynamic> _$$AiMonthlyPlanDayImplToJson(
        _$AiMonthlyPlanDayImpl instance) =>
    <String, dynamic>{
      'dayCode': instance.dayCode,
      'dayLabel': instance.dayLabel,
      'type': instance.type,
      'preferredTime': instance.preferredTime,
      'preferredTimeLabel': instance.preferredTimeLabel,
      'templateId': instance.templateId,
      'templateTitle': instance.templateTitle,
      'focus': instance.focus,
      'exercises': instance.exercises,
      'estimatedMinutes': instance.estimatedMinutes,
      'mobility': instance.mobility,
      'warmUp': instance.warmUp,
      'cooldown': instance.cooldown,
      'loadMultiplier': instance.loadMultiplier,
      'targetSets': instance.targetSets,
      'isDeload': instance.isDeload,
    };

_$AiReassessmentImpl _$$AiReassessmentImplFromJson(Map<String, dynamic> json) =>
    _$AiReassessmentImpl(
      dueAfterDays: (json['dueAfterDays'] as num).toInt(),
      promptTitle: json['promptTitle'] as String,
      summary: json['summary'] as String,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AiReassessmentImplToJson(
        _$AiReassessmentImpl instance) =>
    <String, dynamic>{
      'dueAfterDays': instance.dueAfterDays,
      'promptTitle': instance.promptTitle,
      'summary': instance.summary,
      'questions': instance.questions,
    };
