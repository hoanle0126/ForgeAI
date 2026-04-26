import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/insight/screens/insight_chat_screen.dart';
import 'package:forge_ai/features/insight/screens/insight_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('AI Coach back button returns to insight screen', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final router = GoRouter(
      initialLocation: AppRoutes.insights,
      routes: [
        GoRoute(
          path: AppRoutes.insights,
          builder: (context, state) => const InsightScreen(),
        ),
        GoRoute(
          path: AppRoutes.insightChat,
          builder: (context, state) => const InsightChatScreen(),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(child: MaterialApp.router(routerConfig: router)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('insight-ai-entry')));
    await tester.pumpAndSettle();

    expect(find.text('AI coach'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Insights'), findsOneWidget);
    expect(find.text('AI coach'), findsNothing);
  });
}
