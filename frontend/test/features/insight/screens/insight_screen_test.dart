import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/insight/screens/insight_screen.dart';

import '../support/fake_insight_repository.dart';

void main() {
  Widget buildSubject({required Size size}) {
    return ProviderScope(
      overrides: insightTestOverrides(),
      child: MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: size),
          child: const InsightScreen(),
        ),
      ),
    );
  }

  testWidgets('InsightScreen does not render legacy tabs', (tester) async {
    await tester.pumpWidget(buildSubject(size: const Size(390, 844)));
    await tester.pumpAndSettle();

    expect(find.byType(TabBar), findsNothing);
    expect(find.text('Anatomy'), findsNothing);
    expect(find.text('Ask AI'), findsNothing);
    expect(find.text('Insights'), findsOneWidget);
  });

  testWidgets('mobile layout renders atlas-first structure', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildSubject(size: const Size(390, 844)));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('insight-mobile-layout')), findsOneWidget);
    expect(find.byKey(const ValueKey('insight-wide-layout')), findsNothing);
    expect(find.byKey(const ValueKey('insight-anatomy-panel')), findsOneWidget);
    expect(find.byKey(const ValueKey('insight-metric-strip')), findsWidgets);
  });

  testWidgets('wide layout renders workbench structure', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1024, 768));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildSubject(size: const Size(1024, 768)));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('insight-wide-layout')), findsOneWidget);
    expect(find.byKey(const ValueKey('insight-mobile-layout')), findsNothing);
    expect(find.byKey(const ValueKey('insight-anatomy-panel')), findsOneWidget);
    expect(find.byKey(const ValueKey('muscle-analysis-panel')), findsOneWidget);
  });
}
