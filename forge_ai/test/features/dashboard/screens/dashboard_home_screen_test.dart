import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/dashboard/screens/home/dashboard_home_screen.dart';

void main() {
  Widget buildSubject({required Size size}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: size),
        child: const DashboardHomeScreen(),
      ),
    );
  }

  testWidgets('DashboardHomeScreen presents a guided today plan flow', (
    tester,
  ) async {
    await tester.pumpWidget(buildSubject(size: const Size(390, 844)));

    expect(find.text('Today\'s Plan'), findsOneWidget);
    expect(find.text('Adjusted for recovery'), findsOneWidget);
    expect(
      find.text(
        'You slept a little less, so today\'s session is lighter to help you move well and stay consistent.',
      ),
      findsOneWidget,
    );
    expect(find.text('Start today\'s session'), findsOneWidget);
    expect(find.text('Daily Fuel'), findsOneWidget);
    expect(
      find.text('Set to support a lighter session today.'),
      findsOneWidget,
    );
    expect(find.text('This Week'), findsOneWidget);
    expect(
      find.text('A quick read on the output supporting today\'s lighter plan.'),
      findsOneWidget,
    );
    expect(find.text('VOLUME'), findsNothing);
    expect(find.text('STREAK'), findsNothing);
  });

  testWidgets('DashboardHomeScreen keeps compact layout on mobile width', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildSubject(size: const Size(390, 844)));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey('dashboard-home-compact-layout')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('dashboard-home-comfort-layout')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('dashboard-home-wide-layout')),
      findsNothing,
    );
  });

  testWidgets(
    'DashboardHomeScreen gives compact layout a usable mobile width',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(390, 844));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(buildSubject(size: const Size(390, 844)));
      await tester.pumpAndSettle();

      final compactLayoutSize = tester.getSize(
        find.byKey(const ValueKey('dashboard-home-compact-layout')),
      );

      expect(compactLayoutSize.width, greaterThan(300));
    },
  );

  testWidgets(
    'DashboardHomeScreen uses constrained comfort layout on tablet portrait',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(834, 1194));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(buildSubject(size: const Size(834, 1194)));
      await tester.pumpAndSettle();

      expect(
        find.byKey(const ValueKey('dashboard-home-comfort-layout')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('dashboard-home-compact-layout')),
        findsNothing,
      );
      expect(
        find.byKey(const ValueKey('dashboard-home-wide-layout')),
        findsNothing,
      );
    },
  );

  testWidgets('DashboardHomeScreen uses two-column wide layout on desktop', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildSubject(size: const Size(1280, 800)));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey('dashboard-home-wide-layout')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('dashboard-home-compact-layout')),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('dashboard-home-comfort-layout')),
      findsNothing,
    );
  });
}
