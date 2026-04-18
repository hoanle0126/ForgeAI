import 'package:forge_ai/features/onboarding/screens/ai_plan_preview_screen.dart';
import 'package:forge_ai/features/onboarding/screens/body_profile_screen.dart';
import 'package:forge_ai/features/onboarding/screens/equipment_selection_screen.dart';
import 'package:forge_ai/features/onboarding/screens/goal_selection_screen.dart';
import 'package:forge_ai/features/onboarding/screens/schedule_preference_screen.dart';
import 'package:forge_ai/features/onboarding/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const goalSelection = '/goal-selection';
  static const equipmentSelection = '/equipment';
  static const bodyProfile = '/body-profile';
  static const schedulePreference = '/schedule';
  static const aiPlanPreview = '/ai-plan-preview';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const WelcomeScreen(),
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
  ],
);
