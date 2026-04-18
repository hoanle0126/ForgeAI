import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/core/router/app_router.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SchedulePreferenceScreen extends ConsumerWidget {
  const SchedulePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

                    _buildSectionHeader(
                      'TRAINING DAYS',
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: AppSpacing.md),
                    const TrainingDaysSelector().animate().fadeIn(
                      delay: 300.ms,
                    ),

                    const SizedBox(height: AppSpacing.xxl),

                    const SessionLengthCard().animate().fadeIn(delay: 400.ms),

                    const SizedBox(height: AppSpacing.xxl),

                    _buildSectionHeader(
                      'PREFERRED TIME',
                    ).animate().fadeIn(delay: 500.ms),
                    const SizedBox(height: AppSpacing.md),
                    const PreferredTimeGrid().animate().fadeIn(delay: 600.ms),

                    const SizedBox(height: AppSpacing.xxl),

                    // Aesthetic Image Promo Block
                    Container(
                      height: 140,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        color: AppColors.textDark,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusLg,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.textDark,
                            AppColors.textDark.withValues(alpha: 0.8),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: AppColors.sportOrange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'PRECISION AI SYNC',
                                style: AppTypography.labelUppercase.copyWith(
                                  color: AppColors.cardWhite,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'OPTIMIZE YOUR\nPERFORMANCE WINDOW',
                            style: AppTypography.h3.copyWith(
                              color: AppColors.cardWhite,
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 700.ms),
                  ],
                ),
              ),
            ),

            _buildBottomActionBar(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.labelUppercase.copyWith(
        color: AppColors.textDark.withValues(alpha: 0.8),
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context, WidgetRef ref) {
    final days = ref.watch(selectedDaysProvider);
    final time = ref.watch(preferredTimeProvider);

    final isValid = days.isNotEmpty && time != null;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        bottom: AppSpacing.xl,
        top: AppSpacing.base,
      ),
      child: AppButton(
        text: 'Continue',
        onPressed: isValid
            ? () {
                context.push(AppRoutes.aiPlanPreview);
              }
            : null,
      ),
    );
  }
}

class TrainingDaysSelector extends ConsumerWidget {
  const TrainingDaysSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDays = ref.watch(selectedDaysProvider);

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: TrainingDay.values.map((day) {
        final isSelected = selectedDays.contains(day);
        return GestureDetector(
          onTap: () => ref.read(selectedDaysProvider.notifier).toggle(day),
          child: AnimatedContainer(
            duration: 200.ms,
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.sportOrange : AppColors.inputBg,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.sportOrange.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              day.label,
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? AppColors.cardWhite : AppColors.textDark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SessionLengthCard extends ConsumerWidget {
  const SessionLengthCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(sessionLengthProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'SESSION LENGTH',
              style: AppTypography.labelUppercase.copyWith(
                color: AppColors.textDark.withValues(alpha: 0.8),
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${length.toInt()}',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.sportOrange,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'min',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: AppColors.sportOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          ),
          child: Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 6,
                  activeTrackColor: AppColors.sportOrange,
                  inactiveTrackColor: AppColors.inputBg,
                  thumbColor: AppColors.sportOrange,
                  overlayColor: AppColors.sportOrange.withValues(alpha: 0.1),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 12,
                    elevation: 0,
                  ),
                ),
                child: Slider(
                  value: length,
                  min: 15,
                  max: 120,
                  divisions: 7, // 15, 30, 45, 60, 75, 90, 105, 120
                  onChanged: (val) {
                    ref.read(sessionLengthProvider.notifier).state = val;
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '15 MIN',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDisabled,
                    ),
                  ),
                  Text(
                    '120 MIN',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDisabled,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PreferredTimeGrid extends ConsumerWidget {
  const PreferredTimeGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(preferredTimeProvider);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 64, // Keep height locked!
        mainAxisSpacing: AppSpacing.md,
        crossAxisSpacing: AppSpacing.md,
      ),
      itemCount: PreferredTime.values.length,
      itemBuilder: (context, index) {
        final time = PreferredTime.values[index];
        final isSelected = selectedTime == time;
        return GestureDetector(
          onTap: () {
            ref.read(preferredTimeProvider.notifier).state = time;
          },
          child: AnimatedContainer(
            duration: 200.ms,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.sportOrange : AppColors.inputBg,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  time.icon,
                  size: 18,
                  color: isSelected ? AppColors.cardWhite : AppColors.textDark,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  time.label,
                  style: AppTypography.bodyMedium.copyWith(
                    color: isSelected
                        ? AppColors.cardWhite
                        : AppColors.textDark,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
