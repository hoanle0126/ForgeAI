import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/insight/screens/insight_chat_tab.dart';

void main() {
  testWidgets('Chat Tab displays messages and allows input', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: InsightChatTab()),
        ),
      ),
    );

    // Initial load
    await tester.pumpAndSettle();

    // Check for initial AI message (part of the mock data text)
    expect(find.textContaining('cơ ngực của bạn đang có dấu hiệu quá tải'), findsOneWidget);

    // Enter text and send
    await tester.enterText(find.byType(TextField), 'Test message');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Verify user message appears
    expect(find.text('Test message'), findsOneWidget);
    
    // Wait for AI mock response
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.textContaining('Đây là câu trả lời mô phỏng'), findsOneWidget);
  });
}
