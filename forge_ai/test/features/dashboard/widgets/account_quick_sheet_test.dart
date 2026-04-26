import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/core/theme/app_theme.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_quick_sheet.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_sheet_action_row.dart';

void main() {
  testWidgets('renders centered athlete profile summary and actions', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: Scaffold(
          body: AccountQuickSheet(
            displayName: 'Alex Morgan',
            onViewFullProfile: () {},
            onTrainingPreferences: () {},
            onNotifications: () {},
            onLogOut: () {},
          ),
        ),
      ),
    );

    expect(find.text('ATHLETE PROFILE'), findsOneWidget);
    expect(find.text('Alex Morgan'), findsOneWidget);
    expect(find.text('12-day streak · Readiness 86'), findsOneWidget);
    expect(find.text('STREAK'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('READY'), findsOneWidget);
    expect(find.text('86'), findsOneWidget);
    expect(find.text('LOAD'), findsOneWidget);
    expect(find.text('7.4'), findsOneWidget);
    expect(find.text('FORGEAI COACH'), findsOneWidget);
    expect(find.text('86 READY'), findsOneWidget);
    expect(
      find.text('Upper strength is your best move today.'),
      findsOneWidget,
    );
    expect(
      find.text('Keep hinge work light and finish with mobility.'),
      findsOneWidget,
    );
    expect(find.text('View full profile'), findsOneWidget);
    expect(find.text('Training preferences'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets('calls onViewFullProfile when full profile action is tapped', (
    tester,
  ) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: Scaffold(
          body: AccountQuickSheet(
            displayName: 'Alex Morgan',
            onViewFullProfile: () => tapped = true,
            onTrainingPreferences: () {},
            onNotifications: () {},
            onLogOut: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.text('View full profile'));
    await tester.pump();

    expect(tapped, isTrue);
  });

  testWidgets('secondary actions call their callbacks', (tester) async {
    var trainingTapped = false;
    var notificationsTapped = false;
    var logOutTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: Scaffold(
          body: AccountQuickSheet(
            displayName: 'Alex Morgan',
            onViewFullProfile: () {},
            onTrainingPreferences: () => trainingTapped = true,
            onNotifications: () => notificationsTapped = true,
            onLogOut: () => logOutTapped = true,
          ),
        ),
      ),
    );

    await tester.ensureVisible(find.text('Training preferences'));
    await tester.tap(
      find.ancestor(
        of: find.text('Training preferences'),
        matching: find.byType(AccountSheetActionRow),
      ),
    );
    await tester.pump();

    expect(trainingTapped, isTrue);

    await tester.ensureVisible(find.text('Notifications'));
    await tester.tap(
      find.ancestor(
        of: find.text('Notifications'),
        matching: find.byType(AccountSheetActionRow),
      ),
    );
    await tester.pump();

    expect(notificationsTapped, isTrue);

    await tester.ensureVisible(find.text('Log out'));
    await tester.tap(
      find.ancestor(
        of: find.text('Log out'),
        matching: find.byType(AccountSheetActionRow),
      ),
    );
    await tester.pump();

    expect(logOutTapped, isTrue);
  });
}
