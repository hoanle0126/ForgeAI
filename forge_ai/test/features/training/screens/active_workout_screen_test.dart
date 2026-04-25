import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/features/training/screens/active_workout_screen.dart';

void main() {
  Future<void> pumpActiveWorkoutScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: ActiveWorkoutScreen())),
    );
  }

  Future<void> tapAction(WidgetTester tester, String label) async {
    await tester.ensureVisible(find.text(label));
    await tester.tap(find.text(label));
    await tester.pump();
  }

  testWidgets(
    'ActiveWorkoutScreen initial countdown renders session context without debug CTA',
    (tester) async {
      await pumpActiveWorkoutScreen(tester);

      expect(find.text('LIVE SESSION'), findsOneWidget);
      expect(find.text('Lock in'), findsOneWidget);
      expect(find.text('DB Bench Press'), findsOneWidget);
      expect(find.text('Continue Countdown'), findsOneWidget);
      expect(find.text('Tick'), findsNothing);
    },
  );

  testWidgets('countdown CTA advances into first reps exercise', (
    tester,
  ) async {
    await pumpActiveWorkoutScreen(tester);

    await tapAction(tester, 'Continue Countdown');
    await tapAction(tester, 'Continue Countdown');
    await tapAction(tester, 'Start Movement');

    expect(find.text('DB Bench Press'), findsWidgets);
    expect(find.text('Complete Target Reps'), findsOneWidget);
    expect(find.textContaining('4×8'), findsWidgets);
  });

  testWidgets('completing first reps exercise enters rest with next movement', (
    tester,
  ) async {
    await pumpActiveWorkoutScreen(tester);

    await tapAction(tester, 'Continue Countdown');
    await tapAction(tester, 'Continue Countdown');
    await tapAction(tester, 'Start Movement');
    await tapAction(tester, 'Complete Target Reps');

    expect(find.text('Recover with intent'), findsOneWidget);
    expect(find.textContaining('One-arm Row'), findsWidgets);
    expect(find.text('Continue Rest'), findsOneWidget);
  });

  testWidgets('rest CTA advances to second reps exercise after thirty ticks', (
    tester,
  ) async {
    await pumpActiveWorkoutScreen(tester);

    await tapAction(tester, 'Continue Countdown');
    await tapAction(tester, 'Continue Countdown');
    await tapAction(tester, 'Start Movement');
    await tapAction(tester, 'Complete Target Reps');
    for (var i = 0; i < 30; i += 1) {
      await tapAction(tester, 'Continue Rest');
    }

    expect(find.text('One-arm Row'), findsWidgets);
    expect(find.text('Complete Target Reps'), findsOneWidget);
  });
}
