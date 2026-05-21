import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/core/theme/app_theme.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_sheet_action_row.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/features/training/providers/training_workout_provider.dart';

void main() {
  testWidgets('workout preview deep link opens outside shell navigation', (
    tester,
  ) async {
    appRouter.go(AppRoutes.workoutPreview);

    await tester.pumpWidget(
      MaterialApp.router(theme: appTheme, routerConfig: appRouter),
    );

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

      await tester.ensureVisible(find.text('View full profile'));
      await tester.tap(
        find.ancestor(
          of: find.text('View full profile'),
          matching: find.byType(AccountSheetActionRow),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Account Controls'), findsOneWidget);
      expect(find.text('View full profile'), findsNothing);
      expect(find.text('Training preferences'), findsOneWidget);
      expect(find.text('ATHLETE PROFILE'), findsNothing);
    },
  );

  testWidgets('dashboard notification bell opens quick sheet and full page', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
      ),
    );

    appRouter.go(AppRoutes.dashboard);
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Open notifications'));
    await tester.pumpAndSettle();

    expect(find.text('NOTIFICATIONS'), findsOneWidget);
    expect(find.text('Today\'s alerts'), findsOneWidget);
    expect(find.text('Upper strength starts in 25 min'), findsOneWidget);
    expect(find.text('View all notifications'), findsOneWidget);

    await tester.tap(find.text('View all notifications'));
    await tester.pumpAndSettle();

    expect(find.text('Notification Center'), findsOneWidget);
    expect(find.text('2 unread'), findsOneWidget);
    expect(find.text('Action queue'), findsOneWidget);
    expect(find.text('Workout'), findsOneWidget);
    expect(find.text('Recovery'), findsWidgets);
    expect(find.text('AI insight'), findsWidgets);
    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Earlier'), findsOneWidget);
    expect(find.text("Today's alerts"), findsNothing);
  });

  testWidgets('dashboard account training preferences opens training tab', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          trainingWorkoutProvider.overrideWith(
            (ref) async => todayTrainingWorkoutPlan,
          ),
        ],
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
    expect(find.text('TRAINING'), findsWidgets);
    expect(find.text('Today\'s Workout'), findsOneWidget);
  });

  testWidgets('dashboard account log out returns to login', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
      ),
    );

    appRouter.go(AppRoutes.dashboard);
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Open account sheet'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Log out'));
    await tester.tap(
      find.ancestor(
        of: find.text('Log out'),
        matching: find.byType(AccountSheetActionRow),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sign in'), findsWidgets);
    expect(find.text('ATHLETE PROFILE'), findsNothing);
  });
}
