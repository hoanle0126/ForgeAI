// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_library_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutLibraryWorkoutImpl _$$WorkoutLibraryWorkoutImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutLibraryWorkoutImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  isTemplate: json['isTemplate'] as bool? ?? false,
  scheduledFor: json['scheduledFor'] == null
      ? null
      : DateTime.parse(json['scheduledFor'] as String),
  scheduledDays:
      (json['scheduledDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$TrainingWorkoutScheduleDayEnumMap, e))
          .toList() ??
      const [],
  durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
  difficulty: $enumDecodeNullable(
    _$TrainingWorkoutDifficultyEnumMap,
    json['difficulty'],
  ),
  goal: $enumDecodeNullable(_$TrainingWorkoutGoalEnumMap, json['goal']),
  status:
      $enumDecodeNullable(_$TrainingWorkoutStatusEnumMap, json['status']) ??
      TrainingWorkoutStatus.draft,
  notes: json['notes'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => WorkoutLibraryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$WorkoutLibraryWorkoutImplToJson(
  _$WorkoutLibraryWorkoutImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'isTemplate': instance.isTemplate,
  'scheduledFor': instance.scheduledFor?.toIso8601String(),
  'scheduledDays': instance.scheduledDays
      .map((e) => _$TrainingWorkoutScheduleDayEnumMap[e]!)
      .toList(),
  'durationMinutes': instance.durationMinutes,
  'difficulty': _$TrainingWorkoutDifficultyEnumMap[instance.difficulty],
  'goal': _$TrainingWorkoutGoalEnumMap[instance.goal],
  'status': _$TrainingWorkoutStatusEnumMap[instance.status]!,
  'notes': instance.notes,
  'items': instance.items,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$TrainingWorkoutScheduleDayEnumMap = {
  TrainingWorkoutScheduleDay.mo: 'mo',
  TrainingWorkoutScheduleDay.tu: 'tu',
  TrainingWorkoutScheduleDay.we: 'we',
  TrainingWorkoutScheduleDay.th: 'th',
  TrainingWorkoutScheduleDay.fr: 'fr',
  TrainingWorkoutScheduleDay.sa: 'sa',
  TrainingWorkoutScheduleDay.su: 'su',
};

const _$TrainingWorkoutDifficultyEnumMap = {
  TrainingWorkoutDifficulty.beginner: 'beginner',
  TrainingWorkoutDifficulty.intermediate: 'intermediate',
  TrainingWorkoutDifficulty.advanced: 'advanced',
};

const _$TrainingWorkoutGoalEnumMap = {
  TrainingWorkoutGoal.strength: 'strength',
  TrainingWorkoutGoal.muscleGain: 'muscle_gain',
  TrainingWorkoutGoal.fatLoss: 'fat_loss',
  TrainingWorkoutGoal.mobility: 'mobility',
  TrainingWorkoutGoal.generalFitness: 'general_fitness',
};

const _$TrainingWorkoutStatusEnumMap = {
  TrainingWorkoutStatus.draft: 'draft',
  TrainingWorkoutStatus.planned: 'planned',
  TrainingWorkoutStatus.completed: 'completed',
  TrainingWorkoutStatus.archived: 'archived',
};

_$WorkoutLibraryItemImpl _$$WorkoutLibraryItemImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutLibraryItemImpl(
  id: json['id'] as String?,
  exerciseId: json['exerciseId'] as String?,
  exerciseNameSnapshot: json['exerciseNameSnapshot'] as String,
  order: (json['order'] as num).toInt(),
  restSeconds: (json['restSeconds'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  sets:
      (json['sets'] as List<dynamic>?)
          ?.map((e) => WorkoutLibrarySet.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$WorkoutLibraryItemImplToJson(
  _$WorkoutLibraryItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'exerciseId': instance.exerciseId,
  'exerciseNameSnapshot': instance.exerciseNameSnapshot,
  'order': instance.order,
  'restSeconds': instance.restSeconds,
  'notes': instance.notes,
  'sets': instance.sets,
};

_$WorkoutLibrarySetImpl _$$WorkoutLibrarySetImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutLibrarySetImpl(
  id: json['id'] as String?,
  order: (json['order'] as num).toInt(),
  reps: (json['reps'] as num?)?.toInt(),
  weightKg: (json['weightKg'] as num?)?.toDouble(),
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  restSeconds: (json['restSeconds'] as num?)?.toInt(),
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$$WorkoutLibrarySetImplToJson(
  _$WorkoutLibrarySetImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'reps': instance.reps,
  'weightKg': instance.weightKg,
  'durationSeconds': instance.durationSeconds,
  'restSeconds': instance.restSeconds,
  'isCompleted': instance.isCompleted,
};
