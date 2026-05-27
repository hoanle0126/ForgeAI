// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_create_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetImpl _$$WorkoutSetImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSetImpl(
      order: (json['order'] as num).toInt(),
      reps: (json['reps'] as num?)?.toInt(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      restSeconds: (json['restSeconds'] as num?)?.toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$WorkoutSetImplToJson(_$WorkoutSetImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'reps': instance.reps,
      'weightKg': instance.weightKg,
      'durationSeconds': instance.durationSeconds,
      'restSeconds': instance.restSeconds,
      'isCompleted': instance.isCompleted,
    };

_$WorkoutItemImpl _$$WorkoutItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutItemImpl(
      exerciseId: json['exerciseId'] as String?,
      exerciseName: json['exerciseName'] as String?,
      order: (json['order'] as num).toInt(),
      restSeconds: (json['restSeconds'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      sets:
          (json['sets'] as List<dynamic>?)
              ?.map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkoutItemImplToJson(_$WorkoutItemImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exerciseName': instance.exerciseName,
      'order': instance.order,
      'restSeconds': instance.restSeconds,
      'notes': instance.notes,
      'sets': instance.sets,
    };

_$CreateWorkoutRequestImpl _$$CreateWorkoutRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateWorkoutRequestImpl(
  title: json['title'] as String,
  description: json['description'] as String?,
  isTemplate: json['isTemplate'] as bool? ?? false,
  scheduledFor: json['scheduledFor'] == null
      ? null
      : DateTime.parse(json['scheduledFor'] as String),
  scheduledDays:
      (json['scheduledDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$WorkoutScheduleDayEnumMap, e))
          .toList() ??
      const [],
  durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
  difficulty: $enumDecodeNullable(
    _$WorkoutDifficultyEnumMap,
    json['difficulty'],
  ),
  goal: $enumDecodeNullable(_$WorkoutGoalEnumMap, json['goal']),
  status:
      $enumDecodeNullable(_$WorkoutStatusEnumMap, json['status']) ??
      WorkoutStatus.draft,
  notes: json['notes'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => WorkoutItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CreateWorkoutRequestImplToJson(
  _$CreateWorkoutRequestImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'isTemplate': instance.isTemplate,
  'scheduledFor': instance.scheduledFor?.toIso8601String(),
  'scheduledDays': instance.scheduledDays
      .map((e) => _$WorkoutScheduleDayEnumMap[e]!)
      .toList(),
  'durationMinutes': instance.durationMinutes,
  'difficulty': _$WorkoutDifficultyEnumMap[instance.difficulty],
  'goal': _$WorkoutGoalEnumMap[instance.goal],
  'status': _$WorkoutStatusEnumMap[instance.status]!,
  'notes': instance.notes,
  'items': instance.items,
};

const _$WorkoutScheduleDayEnumMap = {
  WorkoutScheduleDay.mo: 'mo',
  WorkoutScheduleDay.tu: 'tu',
  WorkoutScheduleDay.we: 'we',
  WorkoutScheduleDay.th: 'th',
  WorkoutScheduleDay.fr: 'fr',
  WorkoutScheduleDay.sa: 'sa',
  WorkoutScheduleDay.su: 'su',
};

const _$WorkoutDifficultyEnumMap = {
  WorkoutDifficulty.beginner: 'beginner',
  WorkoutDifficulty.intermediate: 'intermediate',
  WorkoutDifficulty.advanced: 'advanced',
};

const _$WorkoutGoalEnumMap = {
  WorkoutGoal.strength: 'strength',
  WorkoutGoal.muscleGain: 'muscle_gain',
  WorkoutGoal.fatLoss: 'fat_loss',
  WorkoutGoal.mobility: 'mobility',
  WorkoutGoal.generalFitness: 'general_fitness',
};

const _$WorkoutStatusEnumMap = {
  WorkoutStatus.draft: 'draft',
  WorkoutStatus.planned: 'planned',
  WorkoutStatus.completed: 'completed',
  WorkoutStatus.archived: 'archived',
};

_$CreateExerciseRequestImpl _$$CreateExerciseRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateExerciseRequestImpl(
  name: json['name'] as String,
  description: json['description'] as String?,
  muscleGroups:
      (json['muscleGroups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  equipment: json['equipment'] as String,
  difficulty: json['difficulty'] as String,
  instructions:
      (json['instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  safetyNotes:
      (json['safetyNotes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  videoUrl: json['videoUrl'] as String?,
  imageUrl: json['imageUrl'] as String?,
  visibility: json['visibility'] as String? ?? 'private',
);

Map<String, dynamic> _$$CreateExerciseRequestImplToJson(
  _$CreateExerciseRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'muscleGroups': instance.muscleGroups,
  'equipment': instance.equipment,
  'difficulty': instance.difficulty,
  'instructions': instance.instructions,
  'safetyNotes': instance.safetyNotes,
  'videoUrl': instance.videoUrl,
  'imageUrl': instance.imageUrl,
  'visibility': instance.visibility,
};

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      muscleGroups:
          (json['muscleGroups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as String,
      instructions:
          (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      safetyNotes:
          (json['safetyNotes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      videoUrl: json['videoUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      visibility: json['visibility'] as String,
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'muscleGroups': instance.muscleGroups,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'instructions': instance.instructions,
      'safetyNotes': instance.safetyNotes,
      'videoUrl': instance.videoUrl,
      'imageUrl': instance.imageUrl,
      'visibility': instance.visibility,
    };
