import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/core/theme/app_theme.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_sheet_action_row.dart';

void main() {
  testWidgets('workout preview deep link opens outside shell navigation', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp.router(theme: appTheme, routerConfig: appRouter),
    );

    appRouter.go(AppRoutes.workoutPreview);
    await tester.pumpAndSettle();

    expect(find.text('WORKOUT PREVIEW'), findsOneWidget);
    expect(find.text('Begin Workout'), findsOneWidget);
    expect(find.text('TRAINING'), findsNothing);
  });

  testWidgets(
    'dashboard avatar opens account sheet and navigates to profile tab',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
        ),
      );

      appRouter.go(AppRoutes.dashboard);
      await tester.pumpAndSettle();

      await tester.tap(find.bySemanticsLabel('Open account sheet'));
      await tester.pumpAndSettle();

      expect(find.text('ATHLETE PROFILE'), findsOneWidget);
      expect(find.text('View full profile'), findsOneWidget);

      await tester.tap(find.text('View full profile'));
      await tester.pumpAndSettle();

      expect(find.text('Account Controls'), findsOneWidget);
      expect(find.text('Athlete profile'), findsOneWidget);
      expect(find.text('ATHLETE PROFILE'), findsNothing);
    },
  );

  testWidgets('dashboard account secondary action shows snackbar', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
      ),
    );

    appRouter.go(AppRoutes.dashboard);
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Open account sheet'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Training preferences'));
    await tester.tap(
      find.ancestor(
        of: find.text('Training preferences'),
        matching: find.byType(AccountSheetActionRow),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ATHLETE PROFILE'), findsNothing);
    expect(find.text('Training preferences coming soon'), findsOneWidget);
  });
}
