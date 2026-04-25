import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/core/router/app_router.dart';
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

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    expect(find.text('Training'), findsOneWidget);
    expect(find.text('Today\'s Workout'), findsOneWidget);
    expect(find.text('Upper Strength'), findsOneWidget);
    expect(find.text('Start Workout'), findsOneWidget);
    expect(find.text('Weekly Plan'), findsOneWidget);
    expect(find.text('Up Next'), findsOneWidget);
    expect(find.text('ForgeAI Recovery'), findsOneWidget);
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
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );

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
}
