import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/screens/training_screen.dart';
import 'package:forge_ai/features/training/screens/training_statistics_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('opens training statistics from the more sheet', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
        GoRoute(
          path: AppRoutes.trainingStatistics,
          builder: (context, state) => const TrainingStatisticsScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => _statisticsWorkouts,
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Open more menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Statistics'));
    await tester.pumpAndSettle();

    expect(find.text('Training Statistics'), findsOneWidget);
    expect(find.text('Weekly load'), findsOneWidget);
    expect(find.text('Top exercises'), findsOneWidget);
  });

  testWidgets('renders statistics content from workout library data', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: AppRoutes.trainingStatistics,
      routes: [
        GoRoute(
          path: AppRoutes.trainingStatistics,
          builder: (context, state) => const TrainingStatisticsScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => _statisticsWorkouts,
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Load peaks on'), findsNothing);
    expect(find.textContaining('Load peaks on'), findsOneWidget);
    expect(find.text('Status mix'), findsOneWidget);
    expect(find.text('Goal focus'), findsOneWidget);
    expect(find.text('Top exercises'), findsOneWidget);
    expect(find.text('Push-up'), findsOneWidget);
    expect(find.text('ForgeAI Recovery'), findsOneWidget);
  });
}

final _now = DateTime.now();
final _startOfWeek = DateTime(
  _now.year,
  _now.month,
  _now.day,
).subtract(Duration(days: _now.weekday - 1));

final _statisticsWorkouts = [
  WorkoutLibraryWorkout(
    id: 'strength-a',
    title: 'Strength A',
    scheduledFor: _startOfWeek,
    createdAt: _startOfWeek,
    durationMinutes: 32,
    goal: TrainingWorkoutGoal.strength,
    status: TrainingWorkoutStatus.planned,
    items: const [
      WorkoutLibraryItem(
        exerciseId: 'push-up',
        exerciseNameSnapshot: 'Push-up',
        order: 1,
        sets: [
          WorkoutLibrarySet(order: 1, reps: 12),
          WorkoutLibrarySet(order: 2, reps: 12),
        ],
      ),
      WorkoutLibraryItem(
        exerciseId: 'db-row',
        exerciseNameSnapshot: 'DB Row',
        order: 2,
        sets: [WorkoutLibrarySet(order: 1, reps: 10, weightKg: 20)],
      ),
    ],
  ),
  WorkoutLibraryWorkout(
    id: 'strength-b',
    title: 'Strength B',
    scheduledFor: _startOfWeek.add(const Duration(days: 2)),
    createdAt: _startOfWeek.add(const Duration(days: 2)),
    durationMinutes: 40,
    goal: TrainingWorkoutGoal.muscleGain,
    status: TrainingWorkoutStatus.completed,
    items: const [
      WorkoutLibraryItem(
        exerciseId: 'push-up',
        exerciseNameSnapshot: 'Push-up',
        order: 1,
        sets: [WorkoutLibrarySet(order: 1, reps: 15)],
      ),
      WorkoutLibraryItem(
        exerciseId: 'split-squat',
        exerciseNameSnapshot: 'Split Squat',
        order: 2,
        sets: [
          WorkoutLibrarySet(order: 1, reps: 10),
          WorkoutLibrarySet(order: 2, reps: 10),
        ],
      ),
    ],
  ),
  WorkoutLibraryWorkout(
    id: 'mobility-reset',
    title: 'Mobility Reset',
    scheduledFor: _startOfWeek.add(const Duration(days: 4)),
    createdAt: _startOfWeek.add(const Duration(days: 4)),
    durationMinutes: 18,
    goal: TrainingWorkoutGoal.mobility,
    status: TrainingWorkoutStatus.draft,
    items: const [
      WorkoutLibraryItem(
        exerciseId: 'breathing-reach',
        exerciseNameSnapshot: 'Breathing Reach',
        order: 1,
        sets: [WorkoutLibrarySet(order: 1, durationSeconds: 60)],
      ),
    ],
  ),
];
