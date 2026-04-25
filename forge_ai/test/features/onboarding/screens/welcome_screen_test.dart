import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/onboarding/widgets/welcome/welcome_content.dart';

void main() {
  testWidgets('WelcomeContent scrolls before it can overflow', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SizedBox(height: 370, child: WelcomeContent())),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
