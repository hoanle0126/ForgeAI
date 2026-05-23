import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/repositories/workout_library_repository.dart';

enum ActiveWorkoutPhase { countdown, exercise, rest, complete }

const activeWorkoutCountdownSeconds = 3;
const activeWorkoutRestSeconds = 30;

final _activeWorkoutCompletionRepositoryProvider =
    Provider<WorkoutLibraryRepository?>((ref) {
      try {
        return ref.read(workoutLibraryRepositoryProvider);
      } catch (error) {
        if (error is UnimplementedError) {
          return null;
        }
        debugPrint('Workout completion sync unavailable: $error');
        return null;
      }
    });

final activeWorkoutSessionProvider =
    StateNotifierProvider<
      ActiveWorkoutSessionController,
      ActiveWorkoutSessionState
    >(
      (ref) => ActiveWorkoutSessionController(
        workoutLibraryRepository: ref.read(
          _activeWorkoutCompletionRepositoryProvider,
        ),
      ),
    );

class ActiveWorkoutSessionState {
  const ActiveWorkoutSessionState({
    required this.plan,
    required this.currentExerciseIndex,
    required this.currentPhase,
    required this.secondsRemaining,
    required this.isTimerPaused,
    required this.completedExerciseIndexes,
  });

  factory ActiveWorkoutSessionState.initial(TrainingWorkoutPlan plan) {
    return ActiveWorkoutSessionState(
      plan: plan,
      currentExerciseIndex: 0,
      currentPhase: ActiveWorkoutPhase.countdown,
      secondsRemaining: activeWorkoutCountdownSeconds,
      isTimerPaused: false,
      completedExerciseIndexes: const [],
    );
  }

  final TrainingWorkoutPlan plan;
  final int currentExerciseIndex;
  final ActiveWorkoutPhase currentPhase;
  final int secondsRemaining;
  final bool isTimerPaused;
  final List<int> completedExerciseIndexes;

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

  int get completedExerciseCount => completedExerciseIndexes.length;

  bool isExerciseCompleted(int exerciseIndex) {
    return completedExerciseIndexes.contains(exerciseIndex);
  }

  bool get shouldAutoTick =>
      currentPhase == ActiveWorkoutPhase.countdown ||
      currentPhase == ActiveWorkoutPhase.rest ||
      (currentPhase == ActiveWorkoutPhase.exercise &&
          currentExercise.mode == WorkoutExerciseMode.timed &&
          !isTimerPaused &&
          secondsRemaining > 0);

  ActiveWorkoutSessionState copyWith({
    int? currentExerciseIndex,
    ActiveWorkoutPhase? currentPhase,
    int? secondsRemaining,
    bool? isTimerPaused,
    List<int>? completedExerciseIndexes,
  }) {
    return ActiveWorkoutSessionState(
      plan: plan,
      currentExerciseIndex: currentExerciseIndex ?? this.currentExerciseIndex,
      currentPhase: currentPhase ?? this.currentPhase,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isTimerPaused: isTimerPaused ?? this.isTimerPaused,
      completedExerciseIndexes:
          completedExerciseIndexes ?? this.completedExerciseIndexes,
    );
  }
}

class ActiveWorkoutSessionController
    extends StateNotifier<ActiveWorkoutSessionState> {
  ActiveWorkoutSessionController({
    TrainingWorkoutPlan? plan,
    WorkoutLibraryRepository? workoutLibraryRepository,
  }) : _workoutLibraryRepository = workoutLibraryRepository,
       super(
         ActiveWorkoutSessionState.initial(plan ?? todayTrainingWorkoutPlan),
       );

  final WorkoutLibraryRepository? _workoutLibraryRepository;

  void loadPlan(TrainingWorkoutPlan plan) {
    state = ActiveWorkoutSessionState.initial(plan);
  }

  void tick() {
    switch (state.currentPhase) {
      case ActiveWorkoutPhase.countdown:
        _tickCountdown();
        return;
      case ActiveWorkoutPhase.exercise:
        if (state.isTimerPaused) {
          return;
        }
        _tickExercise();
        return;
      case ActiveWorkoutPhase.rest:
        _tickRest();
        return;
      case ActiveWorkoutPhase.complete:
        return;
    }
  }

  void beginExercise() {
    final exercise = state.currentExercise;
    state = state.copyWith(
      currentPhase: ActiveWorkoutPhase.exercise,
      secondsRemaining: exercise.durationSeconds ?? 0,
      isTimerPaused: false,
    );
  }

  void completeRepsExercise() {
    if (state.currentPhase != ActiveWorkoutPhase.exercise ||
        state.currentExercise.mode != WorkoutExerciseMode.reps) {
      return;
    }
    nextExercise();
  }

  void toggleTimedExercisePause() {
    if (state.currentPhase != ActiveWorkoutPhase.exercise ||
        state.currentExercise.mode != WorkoutExerciseMode.timed) {
      return;
    }
    state = state.copyWith(isTimerPaused: !state.isTimerPaused);
  }

  void skipPhase() {
    switch (state.currentPhase) {
      case ActiveWorkoutPhase.countdown:
        beginExercise();
        return;
      case ActiveWorkoutPhase.exercise:
        if (state.currentExercise.mode == WorkoutExerciseMode.timed) {
          nextExercise(markCurrentExerciseCompleted: false);
        }
        return;
      case ActiveWorkoutPhase.rest:
        _startNextExercise();
        return;
      case ActiveWorkoutPhase.complete:
        return;
    }
  }

  void nextExercise({bool markCurrentExerciseCompleted = true}) {
    if (markCurrentExerciseCompleted) {
      _syncCurrentExerciseCompletion();
    }

    final completedExerciseIndexes = markCurrentExerciseCompleted
        ? _appendCompletedExerciseIndex(state.currentExerciseIndex)
        : state.completedExerciseIndexes;

    if (state.nextExercise == null) {
      state = state.copyWith(
        currentPhase: ActiveWorkoutPhase.complete,
        secondsRemaining: 0,
        isTimerPaused: false,
        completedExerciseIndexes: completedExerciseIndexes,
      );
      return;
    }

    state = state.copyWith(
      currentPhase: ActiveWorkoutPhase.rest,
      secondsRemaining: activeWorkoutRestSeconds,
      isTimerPaused: false,
      completedExerciseIndexes: completedExerciseIndexes,
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
      _startNextExercise();
      return;
    }
    state = state.copyWith(secondsRemaining: nextSeconds);
  }

  void _startNextExercise() {
    if (state.nextExercise == null) {
      state = state.copyWith(
        currentPhase: ActiveWorkoutPhase.complete,
        secondsRemaining: 0,
      );
      return;
    }

    final nextIndex = state.currentExerciseIndex + 1;
    final nextExercise = state.plan.exercises[nextIndex];
    state = state.copyWith(
      currentExerciseIndex: nextIndex,
      currentPhase: ActiveWorkoutPhase.exercise,
      secondsRemaining: nextExercise.durationSeconds ?? 0,
      isTimerPaused: false,
    );
  }

  List<int> _appendCompletedExerciseIndex(int exerciseIndex) {
    if (state.completedExerciseIndexes.contains(exerciseIndex)) {
      return state.completedExerciseIndexes;
    }
    final updatedIndexes = [...state.completedExerciseIndexes, exerciseIndex]
      ..sort();
    return updatedIndexes;
  }

  void _syncCurrentExerciseCompletion() {
    final workoutItemId = state.currentExercise.workoutItemId;
    final repository = _workoutLibraryRepository;
    if (workoutItemId == null || repository == null) {
      return;
    }
    unawaited(
      repository
          .completeWorkoutItem(
            workoutId: state.plan.id,
            workoutItemId: workoutItemId,
          )
          .catchError((Object error) {
            if (error is UnimplementedError) {
              return;
            }
            debugPrint('Failed to sync completed workout item: $error');
          }),
    );
  }
}
