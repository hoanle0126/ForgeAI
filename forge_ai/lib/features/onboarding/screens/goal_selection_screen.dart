import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/analysis_card.dart';
import 'package:forge_ai/features/onboarding/widgets/goal_card.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

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
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.base),

                    // Headline
                    RichText(
                          text: TextSpan(
                            style: AppTypography.h1.copyWith(
                              fontSize: 48,
                              height: 1.0,
                              letterSpacing: -1.5,
                            ),
                            children: const [
                              TextSpan(text: "What's your\n"),
                              TextSpan(
                                text: 'goal?',
                                style: TextStyle(color: AppColors.sportOrange),
                              ),
                            ],
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppSpacing.md),

                    Text(
                          "We'll personalize your training\nplan based on your focus.",
                          style: AppTypography.bodyLarge.copyWith(height: 1.4),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 400.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppSpacing.xl),

                    // Goal List
                    ...OnboardingGoal.values.map((goal) {
                      return GoalCard(
                            title: goal.title,
                            subtitle: goal.subtitle,
                            icon: goal.icon,
                            isSelected: selectedGoal == goal,
                            onTap: () {
                              ref.read(selectedGoalProvider.notifier).state =
                                  goal;
                            },
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

                    // Promo Card
                    const PersonalizedAnalysisCard()
                        .animate()
                        .fadeIn(delay: 600.ms)
                        .moveY(begin: 20, end: 0),
                  ],
                ),
              ),
            ),
            _buildBottomActionBar(selectedGoal),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.base,
        vertical: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
                onPressed: () {},
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'SELECT GOAL',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.sportOrange,
                  fontSize: 13,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('STEP 1/5', style: AppTypography.labelUppercase),
              const SizedBox(width: AppSpacing.base),
              Text(
                'SKIP',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(OnboardingGoal? selectedGoal) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'CONTINUE',
        onPressed: selectedGoal != null ? () {} : null,
      ),
    );
  }
}
