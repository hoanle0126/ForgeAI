import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/widgets/body_profile/activity_level_chips.dart';
import 'package:forge_ai/features/onboarding/widgets/body_profile/body_metric_inputs.dart';
import 'package:forge_ai/features/onboarding/widgets/body_profile/body_profile_action_bar.dart';
import 'package:forge_ai/features/onboarding/widgets/common/onboarding_app_bar.dart';

class BodyProfileScreen extends ConsumerWidget {
  const BodyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingAppBar(step: 3, totalSteps: 5, title: 'Profile'),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.base),
                    Text(
                          'Tell us about\nyourself',
                          style: AppTypography.h1.copyWith(
                            fontSize: 40,
                            height: 1.1,
                            letterSpacing: -1.0,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                          'This helps AI calibrate your workouts',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textDisabled,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 400.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    const BodyMetricInputs()
                        .animate()
                        .fadeIn(delay: 200.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    Text(
                      'Activity level',
                      style: AppTypography.h3,
                    ).animate().fadeIn(delay: 300.ms),
                    const SizedBox(height: AppSpacing.md),
                    const ActivityLevelChips().animate().fadeIn(delay: 400.ms),
                  ],
                ),
              ),
            ),
            const BodyProfileActionBar(),
          ],
        ),
      ),
    );
  }
}
