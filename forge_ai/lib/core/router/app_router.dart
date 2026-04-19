import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/screens/auth_screen.dart';
import 'package:forge_ai/features/dashboard/screens/home/dashboard_home_screen.dart';
import 'package:forge_ai/features/dashboard/screens/placeholder/placeholder_screen.dart';
import 'package:forge_ai/features/dashboard/screens/shell/dashboard_shell_screen.dart';
import 'package:forge_ai/features/onboarding/screens/ai_plan_preview/ai_plan_preview_screen.dart';
import 'package:forge_ai/features/onboarding/screens/body_profile/body_profile_screen.dart';
import 'package:forge_ai/features/onboarding/screens/equipment_selection/equipment_selection_screen.dart';
import 'package:forge_ai/features/onboarding/screens/goal_selection/goal_selection_screen.dart';
import 'package:forge_ai/features/onboarding/screens/schedule_preference/schedule_preference_screen.dart';
import 'package:forge_ai/features/onboarding/screens/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const authModeParam = 'mode';
  static const authModeLogin = 'login';
  static const authModeRegister = 'register';
  static const goalSelection = '/goal-selection';
  static const equipmentSelection = '/equipment';
  static const bodyProfile = '/body-profile';
  static const schedulePreference = '/schedule';
  static const aiPlanPreview = '/ai-plan-preview';

  // Dashboard Routes
  static const dashboard = '/dashboard';
  static const training = '/training';
  static const insights = '/insights';
  static const profile = '/profile';

  static String get authLogin => _authWithMode(authModeLogin);
  static String get authRegister => _authWithMode(authModeRegister);

  static String _authWithMode(String mode) {
    return Uri(path: auth, queryParameters: {authModeParam: mode}).toString();
  }
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) {
        final mode =
            state.uri.queryParameters[AppRoutes.authModeParam] ==
                AppRoutes.authModeRegister
            ? AuthMode.register
            : AuthMode.login;

        return AuthScreen(initialMode: mode);
      },
    ),
    GoRoute(
      path: AppRoutes.goalSelection,
      builder: (context, state) => const GoalSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.equipmentSelection,
      builder: (context, state) => const EquipmentSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.bodyProfile,
      builder: (context, state) => const BodyProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.schedulePreference,
      builder: (context, state) => const SchedulePreferenceScreen(),
    ),
    GoRoute(
      path: AppRoutes.aiPlanPreview,
      builder: (context, state) => const AiPlanPreviewScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardShellScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.dashboard,
              builder: (context, state) => const DashboardHomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.training,
              builder: (context, state) =>
                  const PlaceholderScreen(title: 'Training'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.insights,
              builder: (context, state) =>
                  const PlaceholderScreen(title: 'Insights'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) =>
                  const PlaceholderScreen(title: 'Profile'),
            ),
          ],
        ),
      ],
    ),
  ],
);
