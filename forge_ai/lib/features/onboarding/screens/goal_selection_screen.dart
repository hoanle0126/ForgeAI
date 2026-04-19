import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/analysis_card.dart';
import 'package:forge_ai/features/onboarding/widgets/goal_card.dart';
import 'package:forge_ai/features/onboarding/widgets/goal_selection_action_bar.dart';
import 'package:forge_ai/features/onboarding/widgets/goal_selection_header.dart';
import 'package:forge_ai/features/onboarding/widgets/onboarding_app_bar.dart';

class GoalSelectionScreen extends ConsumerWidget {
  const GoalSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoal = ref.watch(selectedGoalProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingAppBar(step: 1, totalSteps: 5, title: 'Goal'),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.base),
                    const GoalSelectionHeader(),
                    const SizedBox(height: AppSpacing.xl),
                    ...OnboardingGoal.values.map((goal) {
                      return GoalCard(
                            title: goal.title,
                            subtitle: goal.subtitle,
                            icon: goal.icon,
                            isSelected: selectedGoal == goal,
                            onTap: () => ref
                                .read(selectedGoalProvider.notifier)
                                .select(goal),
                          )
                          .animate()
                          .fadeIn(
                            delay: Duration(
                              milliseconds: 200 + goal.index * 100,
                            ),
                          )
                          .slideX(begin: 0.1, end: 0);
                    }),
                    const SizedBox(height: AppSpacing.xl),
                    const PersonalizedAnalysisCard()
                        .animate()
                        .fadeIn(delay: 600.ms)
                        .moveY(begin: 20, end: 0),
                  ],
                ),
              ),
            ),
            GoalSelectionActionBar(selectedGoal: selectedGoal),
          ],
        ),
      ),
    );
  }
}
