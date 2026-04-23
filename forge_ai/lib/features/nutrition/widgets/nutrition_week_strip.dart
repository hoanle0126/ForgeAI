import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_day_plan.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';

class NutritionWeekStrip extends ConsumerWidget {
  const NutritionWeekStrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final week = ref.watch(nutritionWeekProvider);
    final selectedIndex = ref.watch(selectedNutritionDayIndexProvider);

    return Row(
      children: [
        for (var index = 0; index < week.length; index++) ...[
          Expanded(
            child: _DayChip(
              day: week[index],
              isSelected: index == selectedIndex,
              onTap: () {
                ref
                    .read(selectedNutritionDayIndexProvider.notifier)
                    .selectDay(index);
              },
            ),
          ),
          if (index != week.length - 1) const SizedBox(width: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  final NutritionDayPlan day;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.sportOrange : AppColors.cardWhite,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.sportOrange : AppColors.border,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.weekdayLabel,
              style: AppTypography.labelUppercase.copyWith(
                fontSize: 11,
                color: isSelected
                    ? AppColors.cardWhite.withValues(alpha: 0.8)
                    : AppColors.textMuted,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${day.dayNumber}',
              style: AppTypography.statMedium.copyWith(
                fontSize: 16,
                color: isSelected ? AppColors.cardWhite : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
