import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_plan_provider.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/ai_plan_action_bar.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/ai_plan_avatar.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/monthly_plan_content.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/monthly_plan_error_state.dart';
import 'package:forge_ai/features/workout_builder/widgets/ai_plan_preview/monthly_plan_loading_state.dart';
import 'package:forge_ai/features/workout_builder/widgets/common/workout_builder_app_bar.dart';

class AiPlanPreviewScreen extends ConsumerWidget {
  const AiPlanPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyPlanAsync = ref.watch(monthlyWorkoutPlanProvider);
    final heroTitle = monthlyPlanAsync.when(
      data: (_) => 'YOUR MONTH 1\nBLOCK IS READY',
      loading: () => 'BUILDING YOUR\nMONTH 1 BLOCK',
      error: (_, _) => 'MONTH 1 BLOCK\nNEEDS A RETRY',
    );
    final heroSubtitle = monthlyPlanAsync.when(
      data: (_) => 'Review the 4-week block before you head back to Training.',
      loading: () =>
          'ForgeAI is turning your interview answers into a full month.',
      error: (_, _) =>
          'Adjust the inputs or retry the request to generate the block again.',
    );

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          children: [
            const WorkoutBuilderAppBar(
              step: 5,
              totalSteps: 5,
              title: '',
              showSkip: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                  left: AppSpacing.lg,
                  right: AppSpacing.lg,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.lg),
                    const AiPlanAvatar()
                        .animate()
                        .scale(delay: 100.ms, duration: 400.ms)
                        .fadeIn(),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                          heroTitle,
                          textAlign: TextAlign.center,
                          style: AppTypography.h1.copyWith(
                            fontSize: 28,
                            height: 1.1,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 200.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                          heroSubtitle,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textDisabled,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    monthlyPlanAsync.when(
                      data: (monthlyPlan) =>
                          MonthlyPlanContent(plan: monthlyPlan.plan)
                              .animate()
                              .fadeIn(delay: 500.ms)
                              .slideY(begin: 0.1, end: 0),
                      loading: () => const MonthlyPlanLoadingState()
                          .animate()
                          .fadeIn(delay: 400.ms),
                      error: (error, stackTrace) => MonthlyPlanErrorState(
                        description: buildMonthlyWorkoutPlanErrorMessage(error),
                        onRetry: () =>
                            ref.invalidate(monthlyWorkoutPlanProvider),
                      ).animate().fadeIn(delay: 400.ms),
                    ),
                  ],
                ),
              ),
            ),
            const AiPlanActionBar().animate().fadeIn(delay: 1000.ms),
          ],
        ),
      ),
    );
  }
}
