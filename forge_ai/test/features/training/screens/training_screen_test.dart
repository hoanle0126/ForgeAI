import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/training/screens/training_screen.dart';

void main() {
  testWidgets('TrainingScreen renders workout plan hub content', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TrainingScreen()));

    expect(find.text('Training'), findsOneWidget);
    expect(find.text('Today\'s Workout'), findsOneWidget);
    expect(find.text('Upper Strength'), findsOneWidget);
    expect(find.text('Start Workout'), findsOneWidget);
    expect(find.text('Weekly Plan'), findsOneWidget);
    expect(find.text('Up Next'), findsOneWidget);
    expect(find.text('ForgeAI Recovery'), findsOneWidget);
  });
}
