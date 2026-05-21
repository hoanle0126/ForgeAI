import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/features/workout_create/models/workout_create_models.dart';
import 'package:forge_ai/features/workout_create/widgets/set_row.dart';

void main() {
  testWidgets('SetRow accepts numbers and blocks letters', (tester) async {
    WorkoutSet updatedSet = const WorkoutSet(order: 1);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SetRow(
            set: const WorkoutSet(order: 1),
            setNumber: 1,
            onUpdate: (set) => updatedSet = set,
            onRemove: () {},
          ),
        ),
      ),
    );

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), '12ab');
    await tester.enterText(fields.at(1), '45.67kg');

    expect(find.text('12'), findsOneWidget);
    expect(find.text('45.67'), findsOneWidget);
    expect(updatedSet.reps, 12);
    expect(updatedSet.weightKg, 45.67);
  });
}
