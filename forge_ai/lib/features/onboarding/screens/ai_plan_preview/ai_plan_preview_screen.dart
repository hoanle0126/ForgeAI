import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/widgets/ai_plan_preview/ai_plan_action_bar.dart';
import 'package:forge_ai/features/onboarding/widgets/ai_plan_preview/ai_plan_avatar.dart';
import 'package:forge_ai/features/onboarding/widgets/ai_plan_preview/ai_quote_block.dart';
import 'package:forge_ai/features/onboarding/widgets/ai_plan_preview/timeline_section.dart';
import 'package:forge_ai/features/onboarding/widgets/common/onboarding_app_bar.dart';

class AiPlanPreviewScreen extends StatelessWidget {
  const AiPlanPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          children: [
            const OnboardingAppBar(
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
                          'HERE\'S YOUR 12-WEEK\nPLAN',
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
                          'Designed by AI, built for you',
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textDisabled,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    const TimelineSection()
                        .animate()
                        .fadeIn(delay: 500.ms)
                        .slideY(begin: 0.1, end: 0),
                    const SizedBox(height: AppSpacing.xxl),
                    const AiQuoteBlock()
                        .animate()
                        .fadeIn(delay: 800.ms)
                        .slideY(begin: 0.1, end: 0),
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
