import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/features/workout_builder/widgets/schedule_preference/schedule_section_header.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

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
            const ScheduleSectionHeader('SESSION LENGTH'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${length.toInt()}',
                  style: AppTypography.statLarge.copyWith(
                    color: AppColors.sportOrange,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'min',
                  style: AppTypography.statSmall.copyWith(
                    color: AppColors.sportOrange,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        AppCard(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: AppSpacing.sm,
                  activeTrackColor: AppColors.sportOrange,
                  inactiveTrackColor: AppColors.inputBg,
                  thumbColor: AppColors.sportOrange,
                  overlayColor: AppColors.sportOrange.withValues(alpha: 0.1),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: AppSpacing.md,
                    elevation: 0,
                  ),
                ),
                child: Slider(
                  value: length,
                  min: 15,
                  max: 120,
                  divisions: 7,
                  onChanged: (value) =>
                      ref.read(sessionLengthProvider.notifier).update(value),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('15 MIN', style: _boundLabelStyle()),
                  Text('120 MIN', style: _boundLabelStyle()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextStyle _boundLabelStyle() {
    return AppTypography.labelUppercase.copyWith(
      color: AppColors.textDisabled,
      fontSize: 10,
      letterSpacing: 0,
    );
  }
}
