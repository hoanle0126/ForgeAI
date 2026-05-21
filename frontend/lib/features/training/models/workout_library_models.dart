import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_library_models.freezed.dart';
part 'workout_library_models.g.dart';

enum TrainingWorkoutDifficulty { beginner, intermediate, advanced }

enum TrainingWorkoutGoal {
  strength,
  @JsonValue('muscle_gain')
  muscleGain,
  @JsonValue('fat_loss')
  fatLoss,
  mobility,
  @JsonValue('general_fitness')
  generalFitness,
}

enum TrainingWorkoutStatus { draft, planned, completed, archived }

@freezed
class WorkoutLibraryWorkout with _$WorkoutLibraryWorkout {
  const WorkoutLibraryWorkout._();

  const factory WorkoutLibraryWorkout({
    required String id,
    required String title,
    String? description,
    @Default(false) bool isTemplate,
    DateTime? scheduledFor,
    int? durationMinutes,
    TrainingWorkoutDifficulty? difficulty,
    TrainingWorkoutGoal? goal,
    @Default(TrainingWorkoutStatus.draft) TrainingWorkoutStatus status,
    String? notes,
    @Default([]) List<WorkoutLibraryItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _WorkoutLibraryWorkout;

  factory WorkoutLibraryWorkout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLibraryWorkoutFromJson(json);

  int get resolvedDurationMinutes {
    if (durationMinutes != null && durationMinutes! > 0) {
      return durationMinutes!;
    }

    final seconds = items.fold<int>(
      0,
      (total, item) => total + item.estimatedSeconds,
    );
    return seconds > 0 ? (seconds / 60).ceil() : 20;
  }

  String get durationLabel => '$resolvedDurationMinutes min';
  String get exerciseCountLabel => '${items.length} exercises';
  String get statusLabel => status.label;
  String get goalLabel => goal?.label ?? 'Custom';
  String get difficultyLabel => difficulty?.label ?? 'Flexible';

  String get scheduleLabel {
    final date = scheduledFor;
    if (date == null) return 'Not scheduled';

    final localDate = date.toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(localDate.year, localDate.month, localDate.day);
    if (target == today) return 'Today';
    if (target == today.add(const Duration(days: 1))) return 'Tomorrow';

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[localDate.month - 1]} ${localDate.day}';
  }

  TrainingWorkoutPlan toTrainingPlan() {
    return TrainingWorkoutPlan(
      id: id,
      title: title,
      durationMinutes: resolvedDurationMinutes,
      intensityLabel: difficultyLabel,
      equipment: const ['Custom workout'],
      aiNote: _planNote,
      exercises: items.map((item) => item.toTrainingExercise()).toList(),
      statusLabel: statusLabel,
      estimatedDateLabel: scheduleLabel,
    );
  }

  String get _planNote {
    final copy = description?.trim();
    if (copy != null && copy.isNotEmpty) return copy;
    return 'ForgeAI keeps this workout ready so you can review the plan, start clean, and adjust loads by readiness.';
  }
}

@freezed
class WorkoutLibraryItem with _$WorkoutLibraryItem {
  const WorkoutLibraryItem._();

  const factory WorkoutLibraryItem({
    String? id,
    String? exerciseId,
    required String exerciseNameSnapshot,
    required int order,
    int? restSeconds,
    String? notes,
    @Default([]) List<WorkoutLibrarySet> sets,
  }) = _WorkoutLibraryItem;

  factory WorkoutLibraryItem.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLibraryItemFromJson(json);

  int get estimatedSeconds {
    final setSeconds = sets.fold<int>(
      0,
      (total, set) => total + set.estimatedSeconds,
    );
    final rest = restSeconds ?? 0;
    return setSeconds + (sets.length * rest);
  }

  TrainingExercise toTrainingExercise() {
    WorkoutLibrarySet? repsSet;
    WorkoutLibrarySet? timedSet;
    for (final set in sets) {
      repsSet ??= set.reps == null ? null : set;
      timedSet ??= set.durationSeconds == null ? null : set;
    }

    final cue = notes?.trim();
    final cues = cue == null || cue.isEmpty
        ? const ['Move with control.']
        : [cue, 'Keep each set repeatable.'];

    if (repsSet == null && timedSet != null) {
      return TrainingExercise(
        name: exerciseNameSnapshot,
        mode: WorkoutExerciseMode.timed,
        durationSeconds: timedSet.durationSeconds ?? 30,
        formCues: cues,
        muscleLabel: 'Workout',
        equipmentLabel: _restLabel,
      );
    }

    return TrainingExercise(
      name: exerciseNameSnapshot,
      mode: WorkoutExerciseMode.reps,
      targetReps: repsSet?.reps ?? 1,
      sets: sets.isEmpty ? 1 : sets.length,
      formCues: cues,
      muscleLabel: 'Workout',
      equipmentLabel: _restLabel,
    );
  }

  String get _restLabel {
    final rest = restSeconds;
    return rest == null || rest == 0 ? 'Custom' : 'Rest ${rest}s';
  }
}

@freezed
class WorkoutLibrarySet with _$WorkoutLibrarySet {
  const WorkoutLibrarySet._();

  const factory WorkoutLibrarySet({
    String? id,
    required int order,
    int? reps,
    double? weightKg,
    int? durationSeconds,
    int? restSeconds,
    @Default(false) bool isCompleted,
  }) = _WorkoutLibrarySet;

  factory WorkoutLibrarySet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLibrarySetFromJson(json);

  int get estimatedSeconds => durationSeconds ?? restSeconds ?? 45;
}

extension TrainingWorkoutDifficultyLabel on TrainingWorkoutDifficulty {
  String get label {
    return switch (this) {
      TrainingWorkoutDifficulty.beginner => 'Beginner',
      TrainingWorkoutDifficulty.intermediate => 'Intermediate',
      TrainingWorkoutDifficulty.advanced => 'Advanced',
    };
  }
}

extension TrainingWorkoutGoalLabel on TrainingWorkoutGoal {
  String get label {
    return switch (this) {
      TrainingWorkoutGoal.strength => 'Strength',
      TrainingWorkoutGoal.muscleGain => 'Muscle Gain',
      TrainingWorkoutGoal.fatLoss => 'Fat Loss',
      TrainingWorkoutGoal.mobility => 'Mobility',
      TrainingWorkoutGoal.generalFitness => 'General Fitness',
    };
  }
}

extension TrainingWorkoutStatusLabel on TrainingWorkoutStatus {
  String get label {
    return switch (this) {
      TrainingWorkoutStatus.draft => 'Draft',
      TrainingWorkoutStatus.planned => 'Planned',
      TrainingWorkoutStatus.completed => 'Completed',
      TrainingWorkoutStatus.archived => 'Archived',
    };
  }
}
