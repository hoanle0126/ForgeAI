import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';

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
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.lg),

                    // AI Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade600.withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.psychology,
                        color: Colors.white,
                        size: 40,
                      ),
                    ).animate().scale(delay: 100.ms, duration: 400.ms).fadeIn(),

                    const SizedBox(height: AppSpacing.xl),

                    // Headings
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

                    // Timeline
                    const TimelineSection()
                        .animate()
                        .fadeIn(delay: 500.ms)
                        .slideY(begin: 0.1, end: 0),

                    const SizedBox(height: AppSpacing.xxl),

                    // Quote Block
                    const AiQuoteBlock()
                        .animate()
                        .fadeIn(delay: 800.ms)
                        .slideY(begin: 0.1, end: 0),
                  ],
                ),
              ),
            ),

            // Start Action
            _buildBottomActionBar().animate().fadeIn(delay: 1000.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'LET\'S START!',
        trailingIcon: Icons.bolt,
        // Override the internal background color of AppButton if necessary
        // but AppButton defaults to sportOrange which is perfect.
        onPressed: () {
          // Navigate to main app
        },
      ),
    );
  }
}

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPhase(
          phase: 'PHASE 1',
          title: 'Foundation',
          subtitle: 'Building base',
          description:
              'Neural adaptation and metabolic priming for the work ahead.',
          color: AppColors.sportOrange,
          isFirst: true,
          isLast: false,
        ),
        _buildPhase(
          phase: 'PHASE 2',
          title: 'Build',
          subtitle: 'Progressive overload',
          description:
              'Increasing intensity and volume to trigger significant body recomposition.',
          color: Colors.blue.shade600,
          isFirst: false,
          isLast: false,
        ),
        _buildPhase(
          phase: 'PHASE 3',
          title: 'Peak',
          subtitle: 'Max performance',
          description:
              'Refining muscle definition and maximizing anaerobic capacity for elite finish.',
          color: Colors.green.shade500,
          isFirst: false,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildPhase({
    required String phase,
    required String title,
    required String subtitle,
    required String description,
    required Color color,
    required bool isFirst,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline graphics
          SizedBox(
            width: 32,
            child: Column(
              children: [
                // Top line
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 1,
                    color: isFirst ? Colors.transparent : Colors.grey.shade300,
                  ),
                ),
                // Dot
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Bottom line
                Expanded(
                  flex: 5,
                  child: Container(
                    width: 1,
                    color: isLast ? Colors.transparent : Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          // Content Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  border: Border(left: BorderSide(color: color, width: 4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          phase,
                          style: AppTypography.labelUppercase.copyWith(
                            color: color,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDisabled,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(title, style: AppTypography.h3),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      description,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textDisabled,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AiQuoteBlock extends StatelessWidget {
  const AiQuoteBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border(left: BorderSide(color: Colors.blue.shade600, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '"Based on your biometrics, we\'ve shifted the first four weeks to prioritize fat loss optimization through steady-state cardiac output, ensuring your metabolic engine is primed before we ramp up the intensity."',
            style: AppTypography.bodyMedium.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: AppColors.textDark.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            '— COACH FORGEAI',
            textAlign: TextAlign.right,
            style: AppTypography.labelUppercase.copyWith(
              color: Colors.blue.shade600,
              fontWeight: FontWeight.w800,
              fontSize: 11,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
