import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/insight/screens/insight_dashboard_tab.dart';

void main() {
  testWidgets('Dashboard Tab shows heat map and summary cards', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: InsightDashboardTab()),
        ),
      ),
    );

    // Initial load state
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for mock data to load
    await tester.pumpAndSettle();

    expect(find.text('Muscle Heat Map'), findsOneWidget);
    expect(find.text('Chest'), findsOneWidget); // From mock data
    expect(find.text('15000.0'), findsOneWidget); // Volume from mock data
    expect(find.text('Total Volume'), findsOneWidget);
  });
}
