import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

void main() {
  Future<void> pumpShellAtRoute(WidgetTester tester, String route) async {
    final router = GoRouter(
      routes: appRouter.configuration.routes,
      initialLocation: route,
      overridePlatformDefaultLocation: true,
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();
  }

  testWidgets('deep-link startup at dashboard mounts shell branch content', (
    tester,
  ) async {
    await pumpShellAtRoute(tester, AppRoutes.dashboard);

    expect(find.text('Today\'s Plan'), findsOneWidget);
    expect(find.text('Start today\'s session'), findsOneWidget);
    expect(find.text('HOME'), findsOneWidget);
  });

  testWidgets('deep-link startup at training mounts shell branch content', (
    tester,
  ) async {
    await pumpShellAtRoute(tester, AppRoutes.training);

    expect(find.text('Today\'s Workout'), findsOneWidget);
    expect(find.text('TRAINING'), findsOneWidget);
  });
}
