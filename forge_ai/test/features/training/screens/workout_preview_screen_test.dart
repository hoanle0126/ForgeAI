import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/screens/workout_preview_screen.dart';

void main() {
  testWidgets('renders workout preview content and CTA', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: WorkoutPreviewScreen(onBeginWorkout: () {})),
    );

    expect(find.text('WORKOUT PREVIEW'), findsOneWidget);
    expect(find.text("TODAY'S WORKOUT"), findsOneWidget);
    expect(find.text(todayTrainingWorkoutPlan.title), findsOneWidget);
    expect(find.text(todayTrainingWorkoutPlan.durationLabel), findsOneWidget);
    expect(
      find.text(todayTrainingWorkoutPlan.exerciseCountLabel),
      findsOneWidget,
    );
    expect(find.text(todayTrainingWorkoutPlan.intensityLabel), findsOneWidget);
    expect(
      find.text(todayTrainingWorkoutPlan.equipment.join(' · ')),
      findsOneWidget,
    );

    expect(find.text('AI PRE-WORKOUT NOTE'), findsOneWidget);
    expect(find.text(todayTrainingWorkoutPlan.aiNote), findsOneWidget);

    expect(find.text('Exercise Checklist'), findsOneWidget);
    for (final exercise in todayTrainingWorkoutPlan.exercises) {
      expect(find.text(exercise.name), findsOneWidget);
      expect(
        find.text('${exercise.muscleLabel} · ${exercise.equipmentLabel}'),
        findsOneWidget,
      );
      expect(find.text(exercise.targetLabel), findsOneWidget);
    }

    expect(find.text('Begin Workout'), findsOneWidget);
  });
}
