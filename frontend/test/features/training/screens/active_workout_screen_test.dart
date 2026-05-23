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
      expect(find.text('DB Bench Press'), findsWidgets);
      expect(find.text('Skip Countdown'), findsOneWidget);
      expect(find.text('Tick'), findsNothing);
    },
  );

  testWidgets('countdown auto advances into first reps exercise', (
    tester,
  ) async {
    await pumpActiveWorkoutScreen(tester);
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();

    expect(find.text('DB Bench Press'), findsWidgets);
    expect(find.text('Complete Target Reps'), findsOneWidget);
    expect(find.textContaining('4×8'), findsWidgets);
  });

  testWidgets('completing first reps exercise enters rest with next movement', (
    tester,
  ) async {
    await pumpActiveWorkoutScreen(tester);
    await tester.pump(const Duration(seconds: 3));
    await tester.pump();
    await tapAction(tester, 'Complete Target Reps');

    expect(find.text('Recover with intent'), findsOneWidget);
    expect(find.textContaining('One-arm Row'), findsWidgets);
    expect(find.text('Skip Rest'), findsOneWidget);
  });

  testWidgets(
    'rest auto advances to second reps exercise after thirty seconds',
    (tester) async {
      await pumpActiveWorkoutScreen(tester);
      await tester.pump(const Duration(seconds: 3));
      await tester.pump();
      await tapAction(tester, 'Complete Target Reps');
      await tester.pump(const Duration(seconds: 30));
      await tester.pump();

      expect(find.text('One-arm Row'), findsWidgets);
      expect(find.text('Complete Target Reps'), findsOneWidget);
    },
  );

  testWidgets(
    'timed exercise shows skip and pause controls, then skips to rest',
    (tester) async {
      await pumpActiveWorkoutScreen(tester);
      await tester.pump(const Duration(seconds: 3));
      await tester.pump();
      await tapAction(tester, 'Complete Target Reps');
      await tester.pump(const Duration(seconds: 30));
      await tester.pump();
      await tapAction(tester, 'Complete Target Reps');
      await tester.pump(const Duration(seconds: 30));
      await tester.pump();

      expect(find.text('Shoulder Press'), findsWidgets);
      expect(find.text('Skip'), findsOneWidget);
      expect(find.text('Pause Timer'), findsOneWidget);

      await tapAction(tester, 'Skip');

      expect(find.text('Skip Rest'), findsOneWidget);
      expect(find.text('Recover with intent'), findsOneWidget);
    },
  );
}
