import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/insight/screens/muscle_detail_screen.dart';

import '../support/fake_insight_repository.dart';

void main() {
  Widget buildSubject(String muscleId) {
    return ProviderScope(
      overrides: insightTestOverrides(),
      child: MaterialApp(home: MuscleDetailScreen(muscleId: muscleId)),
    );
  }

  testWidgets('renders known muscle analysis', (tester) async {
    await tester.pumpWidget(buildSubject('pectoralis_major_r'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Chest'), findsWidgets);
    expect(find.text('Load trend'), findsOneWidget);
    expect(find.text('Exercise contribution'), findsOneWidget);
    expect(find.text('Recovery balance'), findsOneWidget);
  });

  testWidgets('renders unknown muscle empty state', (tester) async {
    await tester.pumpWidget(buildSubject('unknown_muscle'));
    await tester.pumpAndSettle();

    expect(find.text('Unknown muscle'), findsOneWidget);
    expect(
      find.text('No analysis is available for this muscle yet.'),
      findsOneWidget,
    );
  });
}
