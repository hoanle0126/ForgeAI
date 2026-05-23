import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/features/training/models/training_statistics_models.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';

final trainingStatisticsProvider = Provider<AsyncValue<TrainingStatisticsData>>(
  (ref) {
    final workoutsAsync = ref.watch(workoutLibraryProvider);
    return workoutsAsync.whenData(_buildStatistics);
  },
);

TrainingStatisticsData _buildStatistics(List<WorkoutLibraryWorkout> workouts) {
  final trackedWorkouts = workouts
      .where(_isTrackedWorkout)
      .toList(growable: false);
  final weeklyLoad = _buildWeeklyLoad(trackedWorkouts);
  final statusSegments = _buildStatusSegments(trackedWorkouts);
  final goalSegments = _buildGoalSegments(trackedWorkouts);
  final topExercises = _buildTopExercises(trackedWorkouts);
  final plannedMinutes = trackedWorkouts.fold<int>(
    0,
    (total, workout) => total + workout.resolvedDurationMinutes,
  );
  final totalSetBlocks = trackedWorkouts.fold<int>(
    0,
    (total, workout) => total + _countSetBlocks(workout),
  );
  final completedWorkouts = trackedWorkouts
      .where((workout) => workout.status == TrainingWorkoutStatus.completed)
      .length;
  final activeSessionCount = trackedWorkouts.where((workout) {
    return workout.status == TrainingWorkoutStatus.completed ||
        workout.status == TrainingWorkoutStatus.planned;
  }).length;
  final completionRate = activeSessionCount == 0
      ? 0.0
      : completedWorkouts / activeSessionCount;
  final averageSessionMinutes = trackedWorkouts.isEmpty
      ? 0
      : (plannedMinutes / trackedWorkouts.length).round();

  return TrainingStatisticsData(
    trackedWorkouts: trackedWorkouts.length,
    completedWorkouts: completedWorkouts,
    plannedMinutes: plannedMinutes,
    averageSessionMinutes: averageSessionMinutes,
    totalSetBlocks: totalSetBlocks,
    completionRate: completionRate,
    focusGoalLabel: goalSegments.isEmpty ? 'Custom' : goalSegments.first.label,
    busiestDayLabel: _resolveBusiestDay(weeklyLoad),
    insightText: _buildInsight(
      trackedWorkouts: trackedWorkouts,
      weeklyLoad: weeklyLoad,
      goalSegments: goalSegments,
      completionRate: completionRate,
    ),
    weeklyLoad: weeklyLoad,
    statusSegments: statusSegments,
    goalSegments: goalSegments,
    topExercises: topExercises,
  );
}

bool _isTrackedWorkout(WorkoutLibraryWorkout workout) {
  return workout.status != TrainingWorkoutStatus.archived &&
      workout.items.isNotEmpty;
}

int _countSetBlocks(WorkoutLibraryWorkout workout) {
  return workout.items.fold<int>(0, (total, item) {
    return total + (item.sets.isEmpty ? 1 : item.sets.length);
  });
}

List<TrainingStatisticsPoint> _buildWeeklyLoad(
  List<WorkoutLibraryWorkout> workouts,
) {
  const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  final totals = List<double>.filled(labels.length, 0);

  for (final workout in workouts) {
    if (workout.scheduledDays.isNotEmpty) {
      for (final day in workout.scheduledDays) {
        final offset = _weekdayOffsetFromCode(day.name);
        if (offset == null) continue;
        totals[offset] += workout.resolvedDurationMinutes.toDouble();
      }
      continue;
    }

    final date = _resolveActivityDate(workout);
    if (date == null) continue;

    final localDate = DateTime(date.year, date.month, date.day);
    final offset = localDate.difference(startOfWeek).inDays;
    if (offset < 0 || offset >= labels.length) continue;

    totals[offset] += workout.resolvedDurationMinutes.toDouble();
  }

  return [
    for (final indexed in labels.indexed)
      TrainingStatisticsPoint(label: indexed.$2, value: totals[indexed.$1]),
  ];
}

DateTime? _resolveActivityDate(WorkoutLibraryWorkout workout) {
  return workout.scheduledFor ?? workout.updatedAt ?? workout.createdAt;
}

int? _weekdayOffsetFromCode(String dayCode) {
  return switch (dayCode) {
    'mo' => 0,
    'tu' => 1,
    'we' => 2,
    'th' => 3,
    'fr' => 4,
    'sa' => 5,
    'su' => 6,
    _ => null,
  };
}

List<TrainingStatisticsSegment> _buildStatusSegments(
  List<WorkoutLibraryWorkout> workouts,
) {
  final total = workouts.length;
  if (total == 0) return const [];

  final segments = [
    _statusSegment(
      label: 'Completed',
      count: workouts.where((workout) {
        return workout.status == TrainingWorkoutStatus.completed;
      }).length,
      total: total,
    ),
    _statusSegment(
      label: 'Planned',
      count: workouts.where((workout) {
        return workout.status == TrainingWorkoutStatus.planned;
      }).length,
      total: total,
    ),
    _statusSegment(
      label: 'Draft',
      count: workouts.where((workout) {
        return workout.status == TrainingWorkoutStatus.draft;
      }).length,
      total: total,
    ),
  ];

  return segments.where((segment) => segment.count > 0).toList(growable: false);
}

TrainingStatisticsSegment _statusSegment({
  required String label,
  required int count,
  required int total,
}) {
  return TrainingStatisticsSegment(
    label: label,
    count: count,
    ratio: total == 0 ? 0 : count / total,
  );
}

List<TrainingStatisticsSegment> _buildGoalSegments(
  List<WorkoutLibraryWorkout> workouts,
) {
  final total = workouts.length;
  if (total == 0) return const [];

  final counts = <String, int>{};
  for (final workout in workouts) {
    final label = workout.goalLabel;
    counts.update(label, (value) => value + 1, ifAbsent: () => 1);
  }

  final segments =
      counts.entries
          .map(
            (entry) => TrainingStatisticsSegment(
              label: entry.key,
              count: entry.value,
              ratio: entry.value / total,
            ),
          )
          .toList()
        ..sort((left, right) => right.count.compareTo(left.count));

  return segments;
}

List<TrainingExerciseSpotlight> _buildTopExercises(
  List<WorkoutLibraryWorkout> workouts,
) {
  final rollups = <String, _ExerciseRollup>{};

  for (final workout in workouts) {
    for (final item in workout.items) {
      final key = item.exerciseNameSnapshot.trim();
      if (key.isEmpty) continue;

      final rollup = rollups.putIfAbsent(key, () => _ExerciseRollup(key));
      rollup.workoutIds.add(workout.id);
      rollup.setCount += item.sets.isEmpty ? 1 : item.sets.length;
      rollup.totalReps += item.sets.fold<int>(
        0,
        (total, set) => total + (set.reps ?? 0),
      );
    }
  }

  final exercises =
      rollups.values
          .map(
            (rollup) => TrainingExerciseSpotlight(
              name: rollup.name,
              workoutCount: rollup.workoutIds.length,
              setCount: rollup.setCount,
              totalReps: rollup.totalReps,
            ),
          )
          .toList()
        ..sort((left, right) {
          final workoutCompare = right.workoutCount.compareTo(
            left.workoutCount,
          );
          if (workoutCompare != 0) return workoutCompare;

          final setCompare = right.setCount.compareTo(left.setCount);
          if (setCompare != 0) return setCompare;

          return left.name.compareTo(right.name);
        });

  return exercises.take(4).toList(growable: false);
}

String _resolveBusiestDay(List<TrainingStatisticsPoint> weeklyLoad) {
  if (weeklyLoad.isEmpty) return 'Open week';

  final busiest = weeklyLoad.reduce((current, next) {
    return next.value > current.value ? next : current;
  });

  return busiest.value > 0 ? busiest.label : 'Open week';
}

String _buildInsight({
  required List<WorkoutLibraryWorkout> trackedWorkouts,
  required List<TrainingStatisticsPoint> weeklyLoad,
  required List<TrainingStatisticsSegment> goalSegments,
  required double completionRate,
}) {
  if (trackedWorkouts.isEmpty) {
    return 'Save a workout to give ForgeAI a cleaner read on load, focus, and cadence.';
  }

  final dominantGoal = goalSegments.isEmpty
      ? 'Custom'
      : goalSegments.first.label;
  final busiestDay = _resolveBusiestDay(weeklyLoad);
  final hasWeeklyLoad = weeklyLoad.any((point) => point.value > 0);
  final draftCount = trackedWorkouts.where((workout) {
    return workout.status == TrainingWorkoutStatus.draft;
  }).length;
  final plannedCount = trackedWorkouts.where((workout) {
    return workout.status == TrainingWorkoutStatus.planned;
  }).length;

  if (!hasWeeklyLoad) {
    return 'Most plans are still floating without a locked date. Add schedules to reveal where the week really gets heavy.';
  }

  if (completionRate >= 0.6) {
    return 'Completion is steady. Keep recovery lighter around $busiestDay and let $dominantGoal anchor the next block.';
  }

  if (draftCount >= plannedCount && draftCount > 0) {
    return 'Your library is growing faster than sessions are being locked in. Promote one draft into the calendar to tighten consistency.';
  }

  return '$dominantGoal leads the current block. Spread upcoming load away from $busiestDay so the next sessions stay repeatable.';
}

class _ExerciseRollup {
  _ExerciseRollup(this.name);

  final String name;
  final Set<String> workoutIds = <String>{};
  int setCount = 0;
  int totalReps = 0;
}
