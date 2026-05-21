import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/training/models/workout_library_models.dart';
import 'package:forge_ai/features/training/providers/workout_library_provider.dart';
import 'package:forge_ai/features/training/screens/active_workout_screen.dart';
import 'package:forge_ai/features/training/screens/training_screen.dart';
import 'package:forge_ai/features/training/screens/workout_preview_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('TrainingScreen renders workout plan hub content', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
        GoRoute(
          path: AppRoutes.workoutPreview,
          builder: (context, state) => WorkoutPreviewScreen(
            onBeginWorkout: () => context.push(AppRoutes.workoutActive),
          ),
        ),
        GoRoute(
          path: AppRoutes.workoutActive,
          builder: (context, state) => const ActiveWorkoutScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => [_upperStrengthWorkout],
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Training'), findsOneWidget);
    expect(find.text('Today\'s Workout'), findsOneWidget);
    expect(find.text('Upper Strength'), findsNWidgets(2));
    expect(find.text('Start Workout'), findsOneWidget);
    expect(find.text('Weekly Plan'), findsOneWidget);
    expect(
      find.text(DateTime.now().day.toString().padLeft(2, '0')),
      findsOneWidget,
    );
    expect(find.text('Up Next'), findsOneWidget);
    expect(find.text('ForgeAI Recovery'), findsOneWidget);
  });

  testWidgets('TrainingScreen renders empty state when no workouts exist', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [workoutLibraryProvider.overrideWith((ref) async => [])],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Training'), findsOneWidget);
    expect(find.text('No training plan yet'), findsOneWidget);
    expect(find.text('Build First Workout'), findsOneWidget);
    expect(find.text('Today\'s Workout'), findsNothing);
  });

  testWidgets(
    'TrainingScreen renders empty state when workout has no exercises',
    (tester) async {
      final router = GoRouter(
        initialLocation: AppRoutes.training,
        routes: [
          GoRoute(
            path: AppRoutes.training,
            builder: (context, state) => const TrainingScreen(),
          ),
        ],
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            workoutLibraryProvider.overrideWith(
              (ref) async => const [
                WorkoutLibraryWorkout(
                  id: 'empty-plan',
                  title: 'Empty Plan',
                  items: [],
                ),
              ],
            ),
          ],
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No training plan yet'), findsOneWidget);
      expect(find.text('Empty Plan'), findsNothing);
    },
  );

  testWidgets('opens workout builder goal step from AI empty-state CTA', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
        GoRoute(
          path: AppRoutes.workoutBuilderGoal,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Workout builder goal step')),
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [workoutLibraryProvider.overrideWith((ref) async => [])],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ask AI to Build Workout'));
    await tester.pumpAndSettle();

    expect(find.text('Workout builder goal step'), findsOneWidget);
  });

  testWidgets('opens date picker sheet from calendar action', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => [_upperStrengthWorkout],
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Open more menu'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Calendar'));
    await tester.pumpAndSettle();

    expect(find.text('Choose training date'), findsOneWidget);
    expect(find.text('Calendar View'), findsOneWidget);
    expect(find.byType(CalendarDatePicker), findsOneWidget);
    expect(find.text('Select Date'), findsOneWidget);
  });

  testWidgets('starts workout through preview route into active session', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
        GoRoute(
          path: AppRoutes.workoutPreview,
          builder: (context, state) => WorkoutPreviewScreen(
            onBeginWorkout: () => context.push(AppRoutes.workoutActive),
          ),
        ),
        GoRoute(
          path: AppRoutes.workoutActive,
          builder: (context, state) => const ActiveWorkoutScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => [_upperStrengthWorkout],
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Start Workout'));
    await tester.pumpAndSettle();
    expect(find.text('WORKOUT PREVIEW'), findsOneWidget);

    await tester.ensureVisible(find.text('Begin Workout'));
    await tester.tap(find.text('Begin Workout'));
    await tester.pumpAndSettle();

    expect(find.text('LIVE SESSION'), findsOneWidget);
    expect(find.text('Lock in'), findsOneWidget);
    expect(find.text('DB Bench Press'), findsOneWidget);
  });

  testWidgets('selecting a scheduled weekly item updates the hero workout', (
    tester,
  ) async {
    final startDate = DateTime.now();
    final scheduled = DateTime(
      startDate.year,
      startDate.month,
      startDate.day + 1,
    );
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => [
              _upperStrengthWorkout,
              _lowerStarterWorkout.copyWith(scheduledFor: scheduled),
              _mobilityResetWorkout.copyWith(scheduledFor: scheduled),
            ],
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Upper Strength'), findsNWidgets(2));
    expect(find.text('Lower Starter'), findsNothing);

    final scheduledDayFinder = find.text(
      scheduled.day.toString().padLeft(2, '0'),
    );
    await tester.ensureVisible(scheduledDayFinder);
    await tester.pumpAndSettle();
    await tester.tap(scheduledDayFinder);
    await tester.pumpAndSettle();

    expect(find.text('Upper Strength'), findsOneWidget);
    expect(find.text('Lower Starter'), findsOneWidget);
    expect(find.text('Mobility Reset'), findsOneWidget);

    final workoutItemFinder = find.text('Lower Starter');
    await tester.ensureVisible(workoutItemFinder);
    await tester.pumpAndSettle();
    await tester.tap(workoutItemFinder);
    await tester.pumpAndSettle();

    expect(find.text('Lower Starter'), findsNWidgets(2));
  });

  testWidgets('defaults weekly plan to today when today has no workouts', (
    tester,
  ) async {
    final startDate = DateTime.now();
    final scheduled = DateTime(
      startDate.year,
      startDate.month,
      startDate.day + 1,
    );
    final router = GoRouter(
      initialLocation: AppRoutes.training,
      routes: [
        GoRoute(
          path: AppRoutes.training,
          builder: (context, state) => const TrainingScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutLibraryProvider.overrideWith(
            (ref) async => [
              _lowerStarterWorkout.copyWith(scheduledFor: scheduled),
            ],
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No workout today'), findsNWidgets(2));
    expect(
      find.text(
        'Today has no workout scheduled. Keep it light or create one for today.',
      ),
      findsNWidgets(2),
    );
    expect(find.text('Lower Starter'), findsNothing);

    final scheduledDayFinder = find.text(
      scheduled.day.toString().padLeft(2, '0'),
    );
    await tester.ensureVisible(scheduledDayFinder);
    await tester.pumpAndSettle();
    await tester.tap(scheduledDayFinder);
    await tester.pumpAndSettle();

    expect(find.text('No workout today'), findsOneWidget);
    expect(find.text('Lower Starter'), findsOneWidget);

    final workoutItemFinder = find.text('Lower Starter');
    await tester.ensureVisible(workoutItemFinder);
    await tester.pumpAndSettle();
    await tester.tap(workoutItemFinder);
    await tester.pumpAndSettle();

    expect(find.text('No workout today'), findsNothing);
    expect(find.text('Lower Starter'), findsNWidgets(2));
  });
}

final _today = DateTime.now();

final _upperStrengthWorkout = WorkoutLibraryWorkout(
  id: 'upper-strength',
  title: 'Upper Strength',
  scheduledFor: DateTime(_today.year, _today.month, _today.day),
  durationMinutes: 28,
  difficulty: TrainingWorkoutDifficulty.intermediate,
  status: TrainingWorkoutStatus.planned,
  description: 'ForgeAI Recovery keeps the load focused.',
  items: const [
    WorkoutLibraryItem(
      exerciseId: 'db-bench-press',
      exerciseNameSnapshot: 'DB Bench Press',
      order: 1,
      sets: [WorkoutLibrarySet(order: 1, reps: 8)],
    ),
  ],
);

const _lowerStarterWorkout = WorkoutLibraryWorkout(
  id: 'lower-starter',
  title: 'Lower Starter',
  durationMinutes: 24,
  difficulty: TrainingWorkoutDifficulty.beginner,
  status: TrainingWorkoutStatus.draft,
  description: 'Leg day starter.',
  items: [
    WorkoutLibraryItem(
      exerciseId: 'goblet-squat',
      exerciseNameSnapshot: 'Goblet Squat',
      order: 1,
      sets: [WorkoutLibrarySet(order: 1, reps: 10)],
    ),
  ],
);

const _mobilityResetWorkout = WorkoutLibraryWorkout(
  id: 'mobility-reset',
  title: 'Mobility Reset',
  durationMinutes: 12,
  difficulty: TrainingWorkoutDifficulty.beginner,
  status: TrainingWorkoutStatus.planned,
  description: 'Light reset after lifting.',
  items: [
    WorkoutLibraryItem(
      exerciseId: 'hip-flow',
      exerciseNameSnapshot: 'Hip Flow',
      order: 1,
      sets: [WorkoutLibrarySet(order: 1, durationSeconds: 60)],
    ),
  ],
);
