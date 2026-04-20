import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/insight/screens/insight_screen.dart';

void main() {
  testWidgets('InsightScreen shows tabs and can switch between them', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: InsightScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Default tab should be Dashboard
    expect(find.text('Muscle Heat Map'), findsOneWidget);

    // Tap on Ask AI tab
    await tester.tap(find.text('Ask AI'));
    await tester.pumpAndSettle();

    // Should show chat input now
    expect(find.byType(TextField), findsOneWidget);
  });
}
