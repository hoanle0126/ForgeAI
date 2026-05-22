import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';

class TrainingDaysSelector extends ConsumerWidget {
  const TrainingDaysSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDays = ref.watch(selectedDaysProvider);
    final isReady = selectedDays.length == workoutBuilderMonthlyTrainingDays;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
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
                alignment: Alignment.center,
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
                child: Text(
                  day.label,
                  style: AppTypography.bodyMedium.copyWith(
                    color: isSelected
                        ? AppColors.cardWhite
                        : AppColors.textDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          '${selectedDays.length} of $workoutBuilderMonthlyTrainingDays days selected',
          style: AppTypography.bodySmall.copyWith(
            color: isReady ? AppColors.success : AppColors.textDisabled,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Month 1 planning currently runs on exactly 4 weekly sessions.',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textDisabled,
          ),
        ),
      ],
    );
  }
}
