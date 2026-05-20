import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/auth/screens/auth_screen.dart';
import 'package:forge_ai/features/dashboard/screens/home/dashboard_home_screen.dart';
import 'package:forge_ai/features/dashboard/screens/notification_center_screen.dart';
import 'package:forge_ai/features/dashboard/screens/shell/dashboard_shell_screen.dart';
import 'package:forge_ai/features/insight/screens/insight_chat_screen.dart';
import 'package:forge_ai/features/insight/screens/insight_screen.dart';
import 'package:forge_ai/features/insight/screens/muscle_detail_screen.dart';
import 'package:forge_ai/features/nutrition/screens/nutrition_chat_screen.dart';
import 'package:forge_ai/features/nutrition/screens/nutrition_screen.dart';
import 'package:forge_ai/features/profile/screens/profile_screen.dart';
import 'package:forge_ai/features/profile/screens/profile_settings_screen.dart';
import 'package:forge_ai/features/training/screens/active_workout_screen.dart';
import 'package:forge_ai/features/training/screens/training_screen.dart';
import 'package:forge_ai/features/training/screens/workout_preview_screen.dart';
import 'package:forge_ai/features/workout_builder/screens/ai_plan_preview/ai_plan_preview_screen.dart';
import 'package:forge_ai/features/workout_builder/screens/body_profile/body_profile_screen.dart';
import 'package:forge_ai/features/workout_builder/screens/equipment_selection/equipment_selection_screen.dart';
import 'package:forge_ai/features/workout_builder/screens/goal_selection/goal_selection_screen.dart';
import 'package:forge_ai/features/workout_builder/screens/schedule_preference/schedule_preference_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const authModeParam = 'mode';
  static const authModeLogin = 'login';
  static const authModeRegister = 'register';
  static const workoutBuilderGoal = '/workout-builder/goal';
  static const workoutBuilderEquipment = '/workout-builder/equipment';
  static const workoutBuilderBody = '/workout-builder/body';
  static const workoutBuilderSchedule = '/workout-builder/schedule';
  static const workoutBuilderPreview = '/workout-builder/preview';

  // Dashboard Routes
  static const dashboard = '/dashboard';
  static const training = '/training';
  static const workoutPreview = '/training/workout-preview';
  static const workoutActive = '/training/workout-active';
  static const nutrition = '/nutrition';
  static const nutritionChat = '/nutrition/chat';
  static const insights = '/insights';
  static const notifications = '/notifications';
  static const insightMuscleDetailPath = '/insights/muscle/:id';
  static const insightChat = '/insights/chat';
  static const profile = '/profile';
  static const profileSettings = '/profile/settings';

  static String get authLogin => _authWithMode(authModeLogin);
  static String get authRegister => _authWithMode(authModeRegister);

  static String insightMuscleDetail(String id) => '/insights/muscle/$id';

  static String _authWithMode(String mode) {
    return Uri(path: auth, queryParameters: {authModeParam: mode}).toString();
  }
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      redirect: (context, state) => AppRoutes.authLogin,
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
      path: AppRoutes.workoutBuilderGoal,
      builder: (context, state) => const GoalSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.workoutBuilderEquipment,
      builder: (context, state) => const EquipmentSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.workoutBuilderBody,
      builder: (context, state) => const BodyProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.workoutBuilderSchedule,
      builder: (context, state) => const SchedulePreferenceScreen(),
    ),
    GoRoute(
      path: AppRoutes.workoutBuilderPreview,
      builder: (context, state) => const AiPlanPreviewScreen(),
    ),
    GoRoute(
      path: AppRoutes.insightMuscleDetailPath,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return MuscleDetailScreen(muscleId: id);
      },
    ),
    GoRoute(
      path: AppRoutes.insightChat,
      builder: (context, state) => const InsightChatScreen(),
    ),
    GoRoute(
      path: AppRoutes.nutritionChat,
      builder: (context, state) => const NutritionChatScreen(),
    ),
    GoRoute(
      path: AppRoutes.notifications,
      builder: (context, state) => const NotificationCenterScreen(),
    ),
    GoRoute(
      path: AppRoutes.profileSettings,
      builder: (context, state) => ProfileSettingsScreen(
        onTrainingPreferences: () => context.go(AppRoutes.training),
        onNotifications: () => context.push(AppRoutes.notifications),
        onLogOut: () {
          ProviderScope.containerOf(
            context,
            listen: false,
          ).read(authProvider.notifier).logOut();
          context.go(AppRoutes.authLogin);
        },
      ),
    ),
    GoRoute(
      path: AppRoutes.workoutPreview,
      builder: (context, state) => WorkoutPreviewScreen(
        onBeginWorkout: () => context.push(AppRoutes.workoutActive),
      ),
    ),
    GoRoute(
      path: AppRoutes.workoutActive,
      builder: (context, state) => const ActiveWorkoutScreen(),
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
              builder: (context, state) => const TrainingScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.nutrition,
              builder: (context, state) => const NutritionScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.insights,
              builder: (context, state) => const InsightScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
