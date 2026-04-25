import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/core/theme/app_theme.dart';

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
}
