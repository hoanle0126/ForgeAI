enum WorkoutExerciseMode { timed, reps }

class TrainingWorkoutPlan {
  const TrainingWorkoutPlan({
    required this.id,
    required this.title,
    required this.durationMinutes,
    required this.intensityLabel,
    required this.equipment,
    required this.aiNote,
    required this.exercises,
    required this.statusLabel,
    required this.estimatedDateLabel,
  });

  final String id;
  final String title;
  final int durationMinutes;
  final String intensityLabel;
  final List<String> equipment;
  final String aiNote;
  final List<TrainingExercise> exercises;
  final String statusLabel;
  final String estimatedDateLabel;

  String get durationLabel => '$durationMinutes min';
  String get exerciseCountLabel => '${exercises.length} exercises';

  factory TrainingWorkoutPlan.fromWorkoutJson(Map<String, dynamic> json) {
    final exercises = _readList(json, 'exercises')
        .map((item) => item is Map<String, dynamic> ? item : null)
        .whereType<Map<String, dynamic>>()
        .map(_parseExercise)
        .toList(growable: false);

    return TrainingWorkoutPlan(
      id: _readString(json, 'id', fallback: todayTrainingWorkoutPlan.id),
      title: _readString(
        json,
        'title',
        fallback: todayTrainingWorkoutPlan.title,
      ),
      durationMinutes: _readInt(
        json,
        'durationMinutes',
        fallback: todayTrainingWorkoutPlan.durationMinutes,
      ),
      intensityLabel: _readString(
        json,
        'intensityLabel',
        fallback: todayTrainingWorkoutPlan.intensityLabel,
      ),
      equipment: _readStringList(
        json,
        'equipment',
        fallback: todayTrainingWorkoutPlan.equipment,
      ),
      aiNote: _readString(
        json,
        'aiNote',
        fallback: todayTrainingWorkoutPlan.aiNote,
      ),
      exercises: exercises,
      statusLabel: _readString(
        json,
        'statusLabel',
        fallback: todayTrainingWorkoutPlan.statusLabel,
      ),
      estimatedDateLabel: _readString(
        json,
        'estimatedDateLabel',
        fallback: todayTrainingWorkoutPlan.estimatedDateLabel,
      ),
    );
  }
}

class TrainingExercise {
  const TrainingExercise({
    required this.name,
    required this.mode,
    required this.formCues,
    required this.muscleLabel,
    required this.equipmentLabel,
    this.durationSeconds,
    this.targetReps,
    this.sets,
  }) : assert(
         mode != WorkoutExerciseMode.timed || durationSeconds != null,
         'Timed exercises require durationSeconds.',
       ),
       assert(
         mode != WorkoutExerciseMode.reps || targetReps != null,
         'Rep-based exercises require targetReps.',
       ),
       assert(
         mode != WorkoutExerciseMode.timed || targetReps == null,
         'Timed exercises should not define targetReps.',
       ),
       assert(
         mode != WorkoutExerciseMode.timed || sets == null,
         'Timed exercises should not define sets.',
       ),
       assert(durationSeconds == null || durationSeconds > 0),
       assert(targetReps == null || targetReps > 0),
       assert(sets == null || sets > 0);

  final String name;
  final WorkoutExerciseMode mode;
  final int? durationSeconds;
  final int? targetReps;
  final int? sets;
  final List<String> formCues;
  final String muscleLabel;
  final String equipmentLabel;

  String get targetLabel {
    return switch (mode) {
      WorkoutExerciseMode.timed => '$durationSeconds sec',
      WorkoutExerciseMode.reps =>
        sets == null ? '$targetReps reps' : '$sets×$targetReps',
    };
  }

  String get modeLabel {
    return switch (mode) {
      WorkoutExerciseMode.timed => 'Timed',
      WorkoutExerciseMode.reps => 'Reps',
    };
  }
}

const todayTrainingWorkoutPlan = TrainingWorkoutPlan(
  id: 'today-upper-strength',
  title: 'Upper Strength',
  durationMinutes: 28,
  intensityLabel: 'Moderate',
  equipment: ['Dumbbells', 'Bench', 'Mat'],
  aiNote:
      'ForgeAI Recovery keeps the load focused and leaves room to adjust if you are tight on time.',
  exercises: [
    TrainingExercise(
      name: 'DB Bench Press',
      mode: WorkoutExerciseMode.reps,
      targetReps: 8,
      sets: 4,
      muscleLabel: 'Chest',
      equipmentLabel: 'Dumbbells',
      formCues: [
        'Plant feet before every rep.',
        'Lower with control.',
        'Drive evenly through both dumbbells.',
      ],
    ),
    TrainingExercise(
      name: 'One-arm Row',
      mode: WorkoutExerciseMode.reps,
      targetReps: 10,
      sets: 4,
      muscleLabel: 'Back',
      equipmentLabel: 'Bench + Dumbbell',
      formCues: [
        'Keep the torso stable.',
        'Pull elbow toward the hip.',
        'Pause briefly at the top.',
      ],
    ),
    TrainingExercise(
      name: 'Shoulder Press',
      mode: WorkoutExerciseMode.timed,
      durationSeconds: 60,
      muscleLabel: 'Shoulders',
      equipmentLabel: 'Dumbbells',
      formCues: [
        'Brace the midline.',
        'Press in a smooth line.',
        'Keep ribs stacked over hips.',
      ],
    ),
    TrainingExercise(
      name: 'Plank Shoulder Tap',
      mode: WorkoutExerciseMode.timed,
      durationSeconds: 45,
      muscleLabel: 'Core',
      equipmentLabel: 'Mat',
      formCues: [
        'Keep hips quiet.',
        'Tap without shifting weight.',
        'Exhale through the hold.',
      ],
    ),
  ],
  statusLabel: 'Planned',
  estimatedDateLabel: 'Today',
);

String _readString(
  Map<String, dynamic> json,
  String key, {
  required String fallback,
}) {
  final value = json[key];
  return value is String && value.isNotEmpty ? value : fallback;
}

int _readInt(Map<String, dynamic> json, String key, {required int fallback}) {
  final value = json[key];
  return value is int ? value : fallback;
}

List<String> _readStringList(
  Map<String, dynamic> json,
  String key, {
  required List<String> fallback,
}) {
  final value = json[key];
  if (value is List) {
    final result = value
        .whereType<String>()
        .where((item) => item.isNotEmpty)
        .toList(growable: false);
    if (result.isNotEmpty) return result;
  }
  return fallback;
}

List<dynamic> _readList(Map<String, dynamic> json, String key) {
  final value = json[key];
  return value is List ? value : const [];
}

TrainingExercise _parseExercise(Map<String, dynamic> json) {
  final modeValue = _readString(json, 'mode', fallback: 'reps').toLowerCase();
  final mode = modeValue == 'timed'
      ? WorkoutExerciseMode.timed
      : WorkoutExerciseMode.reps;
  final durationSeconds = _readNullableInt(json, 'durationSeconds');
  final targetReps = _readNullableInt(json, 'targetReps');
  final sets = _readNullableInt(json, 'sets');

  return TrainingExercise(
    name: _readString(json, 'name', fallback: 'Exercise'),
    mode: mode,
    durationSeconds: mode == WorkoutExerciseMode.timed
        ? (durationSeconds ?? 30)
        : null,
    targetReps: mode == WorkoutExerciseMode.reps ? (targetReps ?? 1) : null,
    sets: mode == WorkoutExerciseMode.reps ? sets : null,
    muscleLabel: _readString(json, 'muscleLabel', fallback: 'Muscle'),
    equipmentLabel: _readString(json, 'equipmentLabel', fallback: 'Equipment'),
    formCues: _readStringList(
      json,
      'formCues',
      fallback: const ['Move with control.'],
    ),
  );
}

int? _readNullableInt(Map<String, dynamic> json, String key) {
  final value = json[key];
  return value is int ? value : null;
}
