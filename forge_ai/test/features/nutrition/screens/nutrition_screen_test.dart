import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/nutrition/screens/nutrition_screen.dart';

void main() {
  Widget buildScreen() {
    return const ProviderScope(child: MaterialApp(home: NutritionScreen()));
  }

  testWidgets('renders meals header and today summary', (tester) async {
    await tester.pumpWidget(buildScreen());

    expect(find.text('Meals'), findsOneWidget);
    expect(find.text("TODAY'S PLAN"), findsOneWidget);
    expect(find.text('Fuel for strength training'), findsOneWidget);
  });

  testWidgets('switches selected day when tapping week strip item', (
    tester,
  ) async {
    await tester.pumpWidget(buildScreen());

    expect(find.text('Fuel for strength training'), findsOneWidget);
    expect(find.text("TODAY'S PLAN"), findsOneWidget);

    await tester.tap(find.text('Wed'));
    await tester.pumpAndSettle();

    expect(find.text('Performance rebuild'), findsOneWidget);
    expect(find.text('WED PLAN'), findsOneWidget);
  });

  testWidgets('shows meal cards with calories and macro summary', (
    tester,
  ) async {
    await tester.pumpWidget(buildScreen());

    expect(find.text('BREAKFAST'), findsOneWidget);
    expect(find.text('Greek Yogurt Bowl'), findsOneWidget);
    expect(find.text('520 kcal'), findsOneWidget);
    expect(find.text('P 38g • C 52g • F 16g'), findsOneWidget);
  });

  testWidgets('shows AI adjustment floating action button', (tester) async {
    await tester.pumpWidget(buildScreen());

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
