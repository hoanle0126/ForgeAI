import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/core/theme/app_theme.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_quick_sheet.dart';

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
    expect(
      find.text('Today favors upper strength with lighter hinge load.'),
      findsOneWidget,
    );
    expect(find.text('View full profile'), findsOneWidget);
    expect(find.text('Training preferences'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
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

    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: Scaffold(
          body: AccountQuickSheet(
            displayName: 'Alex Morgan',
            onViewFullProfile: () {},
            onTrainingPreferences: () => trainingTapped = true,
            onNotifications: () => notificationsTapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Training preferences'));
    await tester.pump();

    expect(trainingTapped, isTrue);

    await tester.ensureVisible(find.text('Notifications'));
    await tester.tap(find.text('Notifications'));
    await tester.pump();

    expect(notificationsTapped, isTrue);
  });
}
