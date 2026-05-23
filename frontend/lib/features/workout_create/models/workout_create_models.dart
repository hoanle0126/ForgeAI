import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_create_models.freezed.dart';
part 'workout_create_models.g.dart';

enum WorkoutDifficulty { beginner, intermediate, advanced }

enum WorkoutGoal {
  strength,
  @JsonValue('muscle_gain')
  muscleGain,
  @JsonValue('fat_loss')
  fatLoss,
  mobility,
  @JsonValue('general_fitness')
  generalFitness,
}

enum WorkoutStatus { draft, planned, completed, archived }

enum WorkoutScheduleDay {
  mo('Mo', 'Monday'),
  tu('Tu', 'Tuesday'),
  we('We', 'Wednesday'),
  th('Th', 'Thursday'),
  fr('Fr', 'Friday'),
  sa('Sa', 'Saturday'),
  su('Su', 'Sunday');

  const WorkoutScheduleDay(this.shortLabel, this.fullLabel);

  final String shortLabel;
  final String fullLabel;
}

@freezed
class WorkoutSet with _$WorkoutSet {
  const factory WorkoutSet({
    required int order,
    int? reps,
    double? weightKg,
    int? durationSeconds,
    int? restSeconds,
    @Default(false) bool isCompleted,
  }) = _WorkoutSet;

  factory WorkoutSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetFromJson(json);
}

@freezed
class WorkoutItem with _$WorkoutItem {
  const factory WorkoutItem({
    String? exerciseId,
    String? exerciseName,
    required int order,
    int? restSeconds,
    String? notes,
    @Default([]) List<WorkoutSet> sets,
  }) = _WorkoutItem;

  factory WorkoutItem.fromJson(Map<String, dynamic> json) =>
      _$WorkoutItemFromJson(json);
}

@freezed
class CreateWorkoutRequest with _$CreateWorkoutRequest {
  const factory CreateWorkoutRequest({
    required String title,
    String? description,
    @Default(false) bool isTemplate,
    DateTime? scheduledFor,
    @Default([]) List<WorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    WorkoutDifficulty? difficulty,
    WorkoutGoal? goal,
    @Default(WorkoutStatus.draft) WorkoutStatus status,
    String? notes,
    @Default([]) List<WorkoutItem> items,
  }) = _CreateWorkoutRequest;

  factory CreateWorkoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkoutRequestFromJson(json);
}

@freezed
class CreateExerciseRequest with _$CreateExerciseRequest {
  const factory CreateExerciseRequest({
    required String name,
    String? description,
    @Default([]) List<String> muscleGroups,
    required String equipment,
    required String difficulty,
    @Default([]) List<String> instructions,
    @Default([]) List<String> safetyNotes,
    String? videoUrl,
    String? imageUrl,
    @Default('private') String visibility,
  }) = _CreateExerciseRequest;

  factory CreateExerciseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExerciseRequestFromJson(json);
}

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    String? description,
    @Default([]) List<String> muscleGroups,
    required String equipment,
    required String difficulty,
    @Default([]) List<String> instructions,
    @Default([]) List<String> safetyNotes,
    String? videoUrl,
    String? imageUrl,
    required String visibility,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}

@freezed
class ExerciseCreateState with _$ExerciseCreateState {
  const factory ExerciseCreateState({
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<String> muscleGroups,
    @Default('bodyweight') String equipment,
    @Default('beginner') String difficulty,
    @Default('') String instructionsText,
    @Default('') String safetyNotesText,
    @Default('') String videoUrl,
    @Default('') String imageUrl,
    @Default('private') String visibility,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _ExerciseCreateState;
}

@freezed
class WorkoutCreateState with _$WorkoutCreateState {
  const factory WorkoutCreateState({
    String? editingWorkoutId,
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool isTemplate,
    DateTime? scheduledFor,
    @Default([]) List<WorkoutScheduleDay> scheduledDays,
    int? durationMinutes,
    WorkoutDifficulty? difficulty,
    WorkoutGoal? goal,
    @Default(WorkoutStatus.draft) WorkoutStatus status,
    @Default('') String notes,
    @Default([]) List<WorkoutItem> items,
    @Default([]) List<Exercise> availableExercises,
    @Default(false) bool isLoadingExercises,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _WorkoutCreateState;
}

extension WorkoutCreateStateX on WorkoutCreateState {
  bool get isEditing => editingWorkoutId != null;
}

extension WorkoutDifficultyX on WorkoutDifficulty {
  String get label => switch (this) {
    WorkoutDifficulty.beginner => 'Beginner',
    WorkoutDifficulty.intermediate => 'Intermediate',
    WorkoutDifficulty.advanced => 'Advanced',
  };
}

extension WorkoutGoalX on WorkoutGoal {
  String get label => switch (this) {
    WorkoutGoal.strength => 'Strength',
    WorkoutGoal.muscleGain => 'Muscle Gain',
    WorkoutGoal.fatLoss => 'Fat Loss',
    WorkoutGoal.mobility => 'Mobility',
    WorkoutGoal.generalFitness => 'General Fitness',
  };
}
