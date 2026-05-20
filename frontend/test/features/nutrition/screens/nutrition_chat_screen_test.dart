import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/nutrition/screens/nutrition_chat_screen.dart';

void main() {
  Widget buildScreen() {
    return const ProviderScope(child: MaterialApp(home: NutritionChatScreen()));
  }

  testWidgets('renders selected meal plan context for AI adjustments', (
    tester,
  ) async {
    await tester.pumpWidget(buildScreen());

    expect(find.text('Adjust with AI'), findsOneWidget);
    expect(find.text('Fuel for strength training'), findsOneWidget);
    expect(find.text('2140 kcal'), findsOneWidget);
    expect(find.text('162g protein'), findsOneWidget);
    expect(find.text('4 meals'), findsOneWidget);
    expect(find.text('AI PROTOCOL'), findsOneWidget);
  });

  testWidgets('quick adjustment prompt creates user and AI response bubbles', (
    tester,
  ) async {
    await tester.pumpWidget(buildScreen());

    await tester.tap(find.text('Make dinner lighter'));
    await tester.pumpAndSettle();

    expect(find.text('Make dinner lighter'), findsWidgets);
    expect(
      find.textContaining('Adjusted dinner while keeping'),
      findsOneWidget,
    );
  });
}
