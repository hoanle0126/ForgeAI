import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/active_workout_session_provider.dart';

void main() {
  const timedFirstPlan = TrainingWorkoutPlan(
    id: 'timed-first',
    title: 'Timer Test',
    durationMinutes: 2,
    intensityLabel: 'Test',
    equipment: ['Mat'],
    aiNote: 'Test plan',
    exercises: [
      TrainingExercise(
        name: 'Fast Timer',
        mode: WorkoutExerciseMode.timed,
        durationSeconds: 2,
        muscleLabel: 'Core',
        equipmentLabel: 'Mat',
        formCues: ['Brace'],
      ),
      TrainingExercise(
        name: 'Rep Finisher',
        mode: WorkoutExerciseMode.reps,
        targetReps: 5,
        muscleLabel: 'Legs',
        equipmentLabel: 'Bodyweight',
        formCues: ['Stand tall'],
      ),
    ],
    statusLabel: 'Planned',
    estimatedDateLabel: 'Today',
  );

  const repsFirstPlan = TrainingWorkoutPlan(
    id: 'reps-first',
    title: 'Reps Test',
    durationMinutes: 2,
    intensityLabel: 'Test',
    equipment: ['Bodyweight'],
    aiNote: 'Test plan',
    exercises: [
      TrainingExercise(
        name: 'Squat',
        mode: WorkoutExerciseMode.reps,
        targetReps: 8,
        muscleLabel: 'Legs',
        equipmentLabel: 'Bodyweight',
        formCues: ['Chest up'],
      ),
      TrainingExercise(
        name: 'Hold',
        mode: WorkoutExerciseMode.timed,
        durationSeconds: 1,
        muscleLabel: 'Core',
        equipmentLabel: 'Mat',
        formCues: ['Breathe'],
      ),
    ],
    statusLabel: 'Planned',
    estimatedDateLabel: 'Today',
  );

  test('initial countdown is 3 seconds on first exercise', () {
    final controller = ActiveWorkoutSessionController(plan: repsFirstPlan);

    expect(controller.state.currentPhase, ActiveWorkoutPhase.countdown);
    expect(controller.state.secondsRemaining, 3);
    expect(controller.state.currentExerciseIndex, 0);
    expect(controller.state.currentExercise.name, 'Squat');
    expect(controller.state.nextExercise?.name, 'Hold');
  });

  test('countdown ticks into first exercise', () {
    final controller = ActiveWorkoutSessionController(plan: timedFirstPlan);

    controller.tick();
    controller.tick();
    controller.tick();

    expect(controller.state.currentPhase, ActiveWorkoutPhase.exercise);
    expect(controller.state.secondsRemaining, 2);
    expect(controller.state.currentExercise.name, 'Fast Timer');
  });

  test('timed exercise ticks to rest then next exercise', () {
    final controller = ActiveWorkoutSessionController(plan: timedFirstPlan);

    controller.tick();
    controller.tick();
    controller.tick();
    controller.tick();
    controller.tick();

    expect(controller.state.currentPhase, ActiveWorkoutPhase.rest);
    expect(controller.state.secondsRemaining, 30);
    expect(controller.state.currentExerciseIndex, 0);

    for (var i = 0; i < 30; i += 1) {
      controller.tick();
    }

    expect(controller.state.currentPhase, ActiveWorkoutPhase.exercise);
    expect(controller.state.currentExerciseIndex, 1);
    expect(controller.state.currentExercise.name, 'Rep Finisher');
  });

  test(
    'reps exercise completion enters rest when there is another exercise',
    () {
      final controller = ActiveWorkoutSessionController(plan: repsFirstPlan);

      controller.tick();
      controller.tick();
      controller.tick();
      controller.completeRepsExercise();

      expect(controller.state.currentPhase, ActiveWorkoutPhase.rest);
      expect(controller.state.secondsRemaining, 30);
      expect(controller.state.currentExerciseIndex, 0);
      expect(controller.state.nextExercise?.name, 'Hold');
    },
  );

  test('final exercise completion reaches complete', () {
    final controller = ActiveWorkoutSessionController(plan: repsFirstPlan);

    controller.tick();
    controller.tick();
    controller.tick();
    controller.completeRepsExercise();
    for (var i = 0; i < 30; i += 1) {
      controller.tick();
    }
    controller.tick();

    expect(controller.state.currentPhase, ActiveWorkoutPhase.complete);
    expect(controller.state.secondsRemaining, 0);
    expect(controller.state.currentExerciseIndex, 1);
  });

  test('today timed shoulder press advances to rest after enough ticks', () {
    final controller = ActiveWorkoutSessionController();

    controller.tick();
    controller.tick();
    controller.tick();
    controller.completeRepsExercise();
    for (var i = 0; i < 30; i += 1) {
      controller.tick();
    }
    controller.completeRepsExercise();
    for (var i = 0; i < 30; i += 1) {
      controller.tick();
    }

    expect(controller.state.currentExercise.name, 'Shoulder Press');
    expect(controller.state.currentPhase, ActiveWorkoutPhase.exercise);
    expect(controller.state.secondsRemaining, 60);

    for (var i = 0; i < 60; i += 1) {
      controller.tick();
    }

    expect(controller.state.currentPhase, ActiveWorkoutPhase.rest);
    expect(controller.state.secondsRemaining, 30);
    expect(controller.state.nextExercise?.name, 'Plank Shoulder Tap');
  });
}
