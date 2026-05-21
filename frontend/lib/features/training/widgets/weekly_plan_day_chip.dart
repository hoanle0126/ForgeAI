import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/training/widgets/weekly_plan_day_chip_content.dart';

class WeeklyPlanDayChip extends StatelessWidget {
  const WeeklyPlanDayChip({
    super.key,
    required this.label,
    required this.date,
    required this.status,
    required this.accentColor,
    required this.isToday,
    required this.hasWorkout,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String date;
  final String status;
  final Color? accentColor;
  final bool isToday;
  final bool hasWorkout;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final duration = reduceMotion ? Duration.zero : Durations.medium1;
    final color =
        accentColor ?? (isToday ? AppColors.sportOrange : AppColors.textMuted);
    final background = isSelected && hasWorkout
        ? color
        : hasWorkout
        ? AppColors.sportOrangeLight
        : isSelected
        ? AppColors.inputBg
        : AppColors.cardWhite;
    final foreground = isSelected && hasWorkout
        ? AppColors.cardWhite
        : AppColors.textDark;
    final muted = isSelected && hasWorkout
        ? AppColors.cardWhite
        : AppColors.textDisabled;

    return AnimatedScale(
      scale: isSelected ? 1.02 : 1,
      duration: duration,
      curve: Curves.easeOutCubic,
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          child: AnimatedContainer(
            height: AppSpacing.xxl + AppSpacing.xxl,
            duration: duration,
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: isSelected
                    ? color.withValues(alpha: hasWorkout ? 1 : 0.34)
                    : AppColors.border,
              ),
              boxShadow: isSelected && hasWorkout
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.20),
                        blurRadius: AppSpacing.base,
                        offset: const Offset(0, AppSpacing.xs),
                      ),
                    ]
                  : null,
            ),
            child: WeeklyPlanDayChipContent(
              label: label,
              date: date,
              status: status,
              markerColor: color,
              foreground: foreground,
              muted: muted,
              hasWorkout: hasWorkout,
              isSelected: isSelected,
              isToday: isToday,
              duration: duration,
            ),
          ),
        ),
      ),
    );
  }
}
