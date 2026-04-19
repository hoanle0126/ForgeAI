import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/widgets/common/onboarding_app_bar.dart';
import 'package:forge_ai/features/onboarding/widgets/schedule_preference/preferred_time_grid.dart';
import 'package:forge_ai/features/onboarding/widgets/schedule_preference/schedule_ai_promo.dart';
import 'package:forge_ai/features/onboarding/widgets/schedule_preference/schedule_preference_action_bar.dart';
import 'package:forge_ai/features/onboarding/widgets/schedule_preference/schedule_section_header.dart';
import 'package:forge_ai/features/onboarding/widgets/schedule_preference/session_length_card.dart';
import 'package:forge_ai/features/onboarding/widgets/schedule_preference/training_days_selector.dart';

class SchedulePreferenceScreen extends StatelessWidget {
  const SchedulePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingAppBar(step: 4, totalSteps: 5, title: 'Schedule'),
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.base),
                    Text(
                      'WHEN DO\nYOU TRAIN?',
                      style: AppTypography.h1.copyWith(
                        fontSize: 42,
                        height: 1.0,
                        letterSpacing: -1.5,
                        fontWeight: FontWeight.w900,
                      ),
                    ).animate().fadeIn().slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                          'Pick the days and times that work for you',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.textDisabled,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    const ScheduleSectionHeader(
                      'TRAINING DAYS',
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: AppSpacing.md),
                    const TrainingDaysSelector().animate().fadeIn(
                      delay: 300.ms,
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    const SessionLengthCard().animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: AppSpacing.xxl),
                    const ScheduleSectionHeader(
                      'PREFERRED TIME',
                    ).animate().fadeIn(delay: 500.ms),
                    const SizedBox(height: AppSpacing.md),
                    const PreferredTimeGrid().animate().fadeIn(delay: 600.ms),
                    const SizedBox(height: AppSpacing.xxl),
                    const ScheduleAiPromo().animate().fadeIn(delay: 700.ms),
                  ],
                ),
              ),
            ),
            const SchedulePreferenceActionBar(),
          ],
        ),
      ),
    );
  }
}
