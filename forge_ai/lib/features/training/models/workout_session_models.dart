enum WorkoutExerciseMode { timed, reps }

class TrainingWorkoutPlan {
  const TrainingWorkoutPlan({
    required this.title,
    required this.durationMinutes,
    required this.intensityLabel,
    required this.equipment,
    required this.aiNote,
    required this.exercises,
  });

  final String title;
  final int durationMinutes;
  final String intensityLabel;
  final List<String> equipment;
  final String aiNote;
  final List<TrainingExercise> exercises;

  String get durationLabel => '$durationMinutes min';
  String get exerciseCountLabel => '${exercises.length} exercises';
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
  title: 'Upper Strength',
  durationMinutes: 42,
  intensityLabel: 'Moderate',
  equipment: ['Dumbbells', 'Bench'],
  aiNote:
      'Recovery-aware volume today: keep shoulder press controlled and stop each set with clean form.',
  exercises: [
    TrainingExercise(
      name: 'DB Bench Press',
      mode: WorkoutExerciseMode.reps,
      targetReps: 8,
      sets: 4,
      muscleLabel: 'Chest',
      equipmentLabel: 'Dumbbells + Bench',
      formCues: [
        'Plant your feet before the first rep.',
        'Control the descent for two counts.',
        'Press without shrugging your shoulders.',
      ],
    ),
    TrainingExercise(
      name: 'One-arm Row',
      mode: WorkoutExerciseMode.reps,
      targetReps: 10,
      sets: 3,
      muscleLabel: 'Back',
      equipmentLabel: 'Dumbbell',
      formCues: [
        'Keep hips square to the floor.',
        'Pull your elbow toward your back pocket.',
        'Pause briefly at the top of each rep.',
      ],
    ),
    TrainingExercise(
      name: 'Shoulder Press',
      mode: WorkoutExerciseMode.timed,
      durationSeconds: 60,
      muscleLabel: 'Shoulders',
      equipmentLabel: 'Dumbbells',
      formCues: [
        'Brace your core before pressing.',
        'Keep ribs stacked over hips.',
        'Lower the weights with control.',
      ],
    ),
    TrainingExercise(
      name: 'Plank Shoulder Tap',
      mode: WorkoutExerciseMode.timed,
      durationSeconds: 30,
      muscleLabel: 'Core',
      equipmentLabel: 'Bodyweight',
      formCues: [
        'Widen your feet for stability.',
        'Move one hand without rotating hips.',
        'Keep breathing through the full interval.',
      ],
    ),
    TrainingExercise(
      name: 'Incline Curl',
      mode: WorkoutExerciseMode.reps,
      targetReps: 12,
      sets: 3,
      muscleLabel: 'Biceps',
      equipmentLabel: 'Dumbbells + Bench',
      formCues: [
        'Let arms hang fully before curling.',
        'Keep elbows quiet.',
        'Lower slower than you lift.',
      ],
    ),
    TrainingExercise(
      name: 'Farmer Carry Hold',
      mode: WorkoutExerciseMode.timed,
      durationSeconds: 90,
      muscleLabel: 'Grip + Core',
      equipmentLabel: 'Dumbbells',
      formCues: [
        'Stand tall with shoulders down.',
        'Squeeze handles without leaning.',
        'Keep steps slow and even if you walk.',
      ],
    ),
  ],
);
