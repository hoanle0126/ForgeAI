import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';

enum ActiveWorkoutPhase { countdown, exercise, rest, complete }

const activeWorkoutCountdownSeconds = 3;
const activeWorkoutRestSeconds = 30;

final activeWorkoutSessionProvider =
    StateNotifierProvider<
      ActiveWorkoutSessionController,
      ActiveWorkoutSessionState
    >((ref) => ActiveWorkoutSessionController());

class ActiveWorkoutSessionState {
  const ActiveWorkoutSessionState({
    required this.plan,
    required this.currentExerciseIndex,
    required this.currentPhase,
    required this.secondsRemaining,
  });

  factory ActiveWorkoutSessionState.initial(TrainingWorkoutPlan plan) {
    return ActiveWorkoutSessionState(
      plan: plan,
      currentExerciseIndex: 0,
      currentPhase: ActiveWorkoutPhase.countdown,
      secondsRemaining: activeWorkoutCountdownSeconds,
    );
  }

  final TrainingWorkoutPlan plan;
  final int currentExerciseIndex;
  final ActiveWorkoutPhase currentPhase;
  final int secondsRemaining;

  TrainingExercise get currentExercise => plan.exercises[currentExerciseIndex];

  TrainingExercise? get nextExercise {
    final nextIndex = currentExerciseIndex + 1;
    if (nextIndex >= plan.exercises.length) {
      return null;
    }
    return plan.exercises[nextIndex];
  }

  String get exercisePositionLabel =>
      'Exercise ${currentExerciseIndex + 1} of ${plan.exercises.length}';

  String get phaseLabel {
    return switch (currentPhase) {
      ActiveWorkoutPhase.countdown => 'Get ready',
      ActiveWorkoutPhase.exercise => currentExercise.modeLabel,
      ActiveWorkoutPhase.rest => 'Rest',
      ActiveWorkoutPhase.complete => 'Complete',
    };
  }

  String get timerLabel => secondsRemaining <= 0
      ? '0:00'
      : '0:${secondsRemaining.toString().padLeft(2, '0')}';

  ActiveWorkoutSessionState copyWith({
    int? currentExerciseIndex,
    ActiveWorkoutPhase? currentPhase,
    int? secondsRemaining,
  }) {
    return ActiveWorkoutSessionState(
      plan: plan,
      currentExerciseIndex: currentExerciseIndex ?? this.currentExerciseIndex,
      currentPhase: currentPhase ?? this.currentPhase,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
    );
  }
}

class ActiveWorkoutSessionController
    extends StateNotifier<ActiveWorkoutSessionState> {
  ActiveWorkoutSessionController({TrainingWorkoutPlan? plan})
    : super(
        ActiveWorkoutSessionState.initial(plan ?? todayTrainingWorkoutPlan),
      );

  void loadPlan(TrainingWorkoutPlan plan) {
    state = ActiveWorkoutSessionState.initial(plan);
  }

  void tick() {
    switch (state.currentPhase) {
      case ActiveWorkoutPhase.countdown:
        _tickCountdown();
      case ActiveWorkoutPhase.exercise:
        _tickExercise();
      case ActiveWorkoutPhase.rest:
        _tickRest();
      case ActiveWorkoutPhase.complete:
        break;
    }
  }

  void beginExercise() {
    final exercise = state.currentExercise;
    state = state.copyWith(
      currentPhase: ActiveWorkoutPhase.exercise,
      secondsRemaining: exercise.durationSeconds ?? 0,
    );
  }

  void completeRepsExercise() {
    if (state.currentPhase != ActiveWorkoutPhase.exercise ||
        state.currentExercise.mode != WorkoutExerciseMode.reps) {
      return;
    }
    nextExercise();
  }

  void nextExercise() {
    if (state.nextExercise == null) {
      state = state.copyWith(
        currentPhase: ActiveWorkoutPhase.complete,
        secondsRemaining: 0,
      );
      return;
    }

    state = state.copyWith(
      currentPhase: ActiveWorkoutPhase.rest,
      secondsRemaining: activeWorkoutRestSeconds,
    );
  }

  void _tickCountdown() {
    final nextSeconds = state.secondsRemaining - 1;
    if (nextSeconds <= 0) {
      beginExercise();
      return;
    }
    state = state.copyWith(secondsRemaining: nextSeconds);
  }

  void _tickExercise() {
    if (state.currentExercise.mode != WorkoutExerciseMode.timed) {
      return;
    }

    final nextSeconds = state.secondsRemaining - 1;
    if (nextSeconds <= 0) {
      nextExercise();
      return;
    }
    state = state.copyWith(secondsRemaining: nextSeconds);
  }

  void _tickRest() {
    final nextSeconds = state.secondsRemaining - 1;
    if (nextSeconds <= 0) {
      final nextIndex = state.currentExerciseIndex + 1;
      final nextExercise = state.plan.exercises[nextIndex];
      state = state.copyWith(
        currentExerciseIndex: nextIndex,
        currentPhase: ActiveWorkoutPhase.exercise,
        secondsRemaining: nextExercise.durationSeconds ?? 0,
      );
      return;
    }
    state = state.copyWith(secondsRemaining: nextSeconds);
  }
}
