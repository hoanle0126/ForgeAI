import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/core/theme/app_theme.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_tile.dart';

void main() {
  testWidgets('profile page shows only actionable account drawer items', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
      ),
    );

    appRouter.go(AppRoutes.profile);
    await tester.pumpAndSettle();

    expect(find.text('Account Controls'), findsOneWidget);
    expect(find.text('View full profile'), findsNothing);
    expect(find.text('Training preferences'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
    expect(find.text('Plan preferences'), findsNothing);
    expect(find.text('Privacy and data'), findsNothing);
  });

  testWidgets('profile header settings action opens profile settings page', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
      ),
    );

    appRouter.go(AppRoutes.profile);
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Open profile settings'));
    await tester.pumpAndSettle();

    expect(find.text('Profile Settings'), findsOneWidget);
    expect(
      find.text('Account, training preferences, and app controls'),
      findsOneWidget,
    );
    expect(find.text('AI TRAINING PROFILE'), findsOneWidget);
    expect(find.text('Training Preferences'), findsOneWidget);
    expect(find.text('App Preferences'), findsOneWidget);
    expect(find.text('Account Controls'), findsOneWidget);
    expect(find.text('Workout reminders'), findsOneWidget);
    expect(find.text('Recovery nudges'), findsOneWidget);
    expect(find.text('AI coaching tone'), findsOneWidget);
    expect(find.text('Balanced'), findsOneWidget);
    expect(find.text('Metric'), findsOneWidget);
  });

  testWidgets('profile training preferences opens training tab', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(theme: appTheme, routerConfig: appRouter),
      ),
    );

    appRouter.go(AppRoutes.profile);
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Training preferences'));
    await tester.tap(
      find.ancestor(
        of: find.text('Training preferences'),
        matching: find.byType(ProfileSettingsTile),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('TRAINING'), findsWidgets);
    expect(find.text('Today\'s Workout'), findsOneWidget);
  });
}
