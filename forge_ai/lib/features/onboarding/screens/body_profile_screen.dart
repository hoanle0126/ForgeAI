import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/metric_input_field.dart';
import 'package:forge_ai/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

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

                    // Inputs Card
                    Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            color: AppColors.cardWhite,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusLg,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: MetricInputField(
                                      label: 'HEIGHT',
                                      hint: '175cm',
                                      initialValue: ref.read(heightProvider),
                                      onChanged: (val) =>
                                          ref
                                                  .read(heightProvider.notifier)
                                                  .state =
                                              val,
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Expanded(
                                    child: MetricInputField(
                                      label: 'WEIGHT',
                                      hint: '70kg',
                                      initialValue: ref.read(weightProvider),
                                      onChanged: (val) =>
                                          ref
                                                  .read(weightProvider.notifier)
                                                  .state =
                                              val,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              MetricInputField(
                                label: 'AGE',
                                hint: '25',
                                initialValue: ref.read(ageProvider),
                                onChanged: (val) =>
                                    ref.read(ageProvider.notifier).state = val,
                              ),
                            ],
                          ),
                        )
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

            // Standard Unified Footer
            _buildBottomActionBar(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context, WidgetRef ref) {
    // Basic validation logic for enabling continue
    final h = ref.watch(heightProvider);
    final w = ref.watch(weightProvider);
    final a = ref.watch(ageProvider);
    final act = ref.watch(activityLevelProvider);

    final isValid = h.isNotEmpty && w.isNotEmpty && a.isNotEmpty && act != null;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'Continue',
        trailingIcon: Icons.arrow_forward,
        onPressed: isValid
            ? () {
                context.push(AppRoutes.schedulePreference);
              }
            : null,
      ),
    );
  }
}

class ActivityLevelChips extends ConsumerWidget {
  const ActivityLevelChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(activityLevelProvider);

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: ActivityLevel.values.map((level) {
        final isSelected = selected == level;
        return GestureDetector(
          onTap: () {
            ref.read(activityLevelProvider.notifier).state = level;
          },
          child: AnimatedContainer(
            duration: 200.ms,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.sportOrange : AppColors.inputBg,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              level.title,
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? AppColors.cardWhite : AppColors.textDark,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
