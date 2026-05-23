import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/insight/models/insight_models.dart';
import 'package:forge_ai/features/insight/providers/insight_provider.dart';
import 'package:forge_ai/features/insight/repositories/insight_repository.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';

class FakeInsightRepository implements InsightRepository {
  const FakeInsightRepository({required this.overview, required this.reply});

  final InsightOverviewData overview;
  final InsightMessage reply;

  @override
  Future<InsightOverviewData> fetchOverview() async => overview;

  @override
  Future<InsightMessage> sendChatMessage({
    required String prompt,
    required String selectedMuscleId,
  }) async {
    return reply.copyWith(content: '${reply.content} [$selectedMuscleId]');
  }
}

List<Override> insightTestOverrides({DateTime? now}) {
  final fixture = buildInsightOverviewFixture(now: now);
  return [
    insightRepositoryProvider.overrideWithValue(
      FakeInsightRepository(
        overview: fixture,
        reply: const InsightMessage(
          id: 'reply-1',
          content: 'Backend insight reply',
          isUser: false,
          hasChart: true,
        ),
      ),
    ),
  ];
}

InsightOverviewData buildInsightOverviewFixture({DateTime? now}) {
  final current = now ?? DateTime.now();
  final currentWeekWorkout = WorkoutLibraryWorkout(
    id: 'workout-current',
    title: 'Upper Push & Pull',
    status: TrainingWorkoutStatus.completed,
    scheduledFor: current.subtract(const Duration(days: 1)),
    items: const [
      WorkoutLibraryItem(
        exerciseId: 'exercise-chest',
        exerciseNameSnapshot: 'Bench Press',
        order: 1,
        sets: [
          WorkoutLibrarySet(order: 1, reps: 10, weightKg: 40),
          WorkoutLibrarySet(order: 2, reps: 10, weightKg: 40),
          WorkoutLibrarySet(order: 3, reps: 8, weightKg: 42),
        ],
      ),
      WorkoutLibraryItem(
        exerciseId: 'exercise-back',
        exerciseNameSnapshot: 'Seated Row',
        order: 2,
        sets: [
          WorkoutLibrarySet(order: 1, reps: 12, weightKg: 32),
          WorkoutLibrarySet(order: 2, reps: 12, weightKg: 32),
        ],
      ),
      WorkoutLibraryItem(
        exerciseId: 'exercise-legs',
        exerciseNameSnapshot: 'Goblet Squat',
        order: 3,
        sets: [
          WorkoutLibrarySet(order: 1, reps: 12, weightKg: 24),
          WorkoutLibrarySet(order: 2, reps: 12, weightKg: 24),
        ],
      ),
    ],
  );

  final previousWeekWorkout = WorkoutLibraryWorkout(
    id: 'workout-previous',
    title: 'Push Focus',
    status: TrainingWorkoutStatus.completed,
    scheduledFor: current.subtract(const Duration(days: 8)),
    items: const [
      WorkoutLibraryItem(
        exerciseId: 'exercise-chest',
        exerciseNameSnapshot: 'Bench Press',
        order: 1,
        sets: [
          WorkoutLibrarySet(order: 1, reps: 10, weightKg: 35),
          WorkoutLibrarySet(order: 2, reps: 10, weightKg: 35),
        ],
      ),
      WorkoutLibraryItem(
        exerciseId: 'exercise-core',
        exerciseNameSnapshot: 'Forearm Plank',
        order: 2,
        sets: [
          WorkoutLibrarySet(order: 1, durationSeconds: 45),
          WorkoutLibrarySet(order: 2, durationSeconds: 45),
        ],
      ),
    ],
  );

  final workouts = [currentWeekWorkout, previousWeekWorkout];
  final chestVolume = workouts
      .expand((workout) => workout.items)
      .where((item) => item.exerciseId == 'exercise-chest')
      .expand((item) => item.sets)
      .fold<double>(
        0,
        (sum, set) => sum + (set.reps ?? 0) * (set.weightKg ?? 1),
      );
  final backVolume = workouts
      .expand((workout) => workout.items)
      .where((item) => item.exerciseId == 'exercise-back')
      .expand((item) => item.sets)
      .fold<double>(
        0,
        (sum, set) => sum + (set.reps ?? 0) * (set.weightKg ?? 1),
      );
  final coreVolume = workouts
      .expand((workout) => workout.items)
      .where((item) => item.exerciseId == 'exercise-core')
      .expand((item) => item.sets)
      .fold<double>(
        0,
        (sum, set) => sum + (set.durationSeconds?.toDouble() ?? 0),
      );

  return InsightOverviewData(
    muscleData: [
      MuscleData(
        id: 'pectoralis_major_r',
        volume: chestVolume,
        rpe: 7.3,
        status: MuscleTrainingStatus.moderate,
      ),
      MuscleData(
        id: 'latissimus_dorsi_r',
        volume: backVolume,
        rpe: 6.6,
        status: MuscleTrainingStatus.moderate,
      ),
      MuscleData(
        id: 'rectus_abdominis_1',
        volume: coreVolume,
        rpe: 5.0,
        status: MuscleTrainingStatus.recovered,
      ),
    ],
    muscleAnalyses: [
      MuscleAnalysis(
        muscleId: 'pectoralis_major_r',
        displayName: 'Chest (R)',
        status: MuscleTrainingStatus.moderate,
        volume: chestVolume,
        rpe: 7.3,
        trendPercent: 12,
        fatigueScore: 58,
        recommendation:
            'Chest (R) is in a productive zone. Keep volume stable and prioritize clean reps.',
        loadTrend: const [
          ChartPoint(label: 'W1', value: 0),
          ChartPoint(label: 'W2', value: 700),
          ChartPoint(label: 'W3', value: 950),
          ChartPoint(label: 'W4', value: 1316),
        ],
        exerciseContributions: [
          ExerciseContribution(
            exerciseName: 'Bench Press',
            volume: chestVolume,
          ),
        ],
        recoveryBalance: const [
          ChartPoint(label: 'Load', value: 58),
          ChartPoint(label: 'Recovery', value: 62),
        ],
      ),
      MuscleAnalysis(
        muscleId: 'latissimus_dorsi_r',
        displayName: 'Back (R)',
        status: MuscleTrainingStatus.moderate,
        volume: backVolume,
        rpe: 6.6,
        trendPercent: 8,
        fatigueScore: 49,
        recommendation:
            'Back (R) is in a productive zone. Keep volume stable and prioritize clean reps.',
        loadTrend: const [
          ChartPoint(label: 'W1', value: 0),
          ChartPoint(label: 'W2', value: 500),
          ChartPoint(label: 'W3', value: 600),
          ChartPoint(label: 'W4', value: 768),
        ],
        exerciseContributions: [
          ExerciseContribution(exerciseName: 'Seated Row', volume: backVolume),
        ],
        recoveryBalance: const [
          ChartPoint(label: 'Load', value: 49),
          ChartPoint(label: 'Recovery', value: 70),
        ],
      ),
      MuscleAnalysis(
        muscleId: 'rectus_abdominis_1',
        displayName: 'Core',
        status: MuscleTrainingStatus.recovered,
        volume: coreVolume,
        rpe: 5.0,
        trendPercent: 4,
        fatigueScore: 32,
        recommendation:
            'Core is ready for progression. Add one quality set or a controlled intensity bump.',
        loadTrend: const [
          ChartPoint(label: 'W1', value: 0),
          ChartPoint(label: 'W2', value: 90),
          ChartPoint(label: 'W3', value: 90),
          ChartPoint(label: 'W4', value: 90),
        ],
        exerciseContributions: [
          ExerciseContribution(
            exerciseName: 'Forearm Plank',
            volume: coreVolume,
          ),
        ],
        recoveryBalance: const [
          ChartPoint(label: 'Load', value: 32),
          ChartPoint(label: 'Recovery', value: 82),
        ],
      ),
    ],
    messages: const [
      InsightMessage(
        id: 'insight-initial',
        content:
            'Chest (R) is currently in balanced load. Open a muscle to inspect trend and contribution.',
        isUser: false,
      ),
    ],
    selectedMuscleId: 'pectoralis_major_r',
  );
}
