import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WeeklyPlanDayChipContent extends StatelessWidget {
  const WeeklyPlanDayChipContent({
    super.key,
    required this.label,
    required this.date,
    required this.status,
    required this.markerColor,
    required this.foreground,
    required this.muted,
    required this.hasWorkout,
    required this.isSelected,
    required this.isToday,
    required this.duration,
  });

  final String label;
  final String date;
  final String status;
  final Color markerColor;
  final Color foreground;
  final Color muted;
  final bool hasWorkout;
  final bool isSelected;
  final bool isToday;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: AppSpacing.sm,
          child: AnimatedOpacity(
            opacity: isToday ? 1 : 0,
            duration: duration,
            child: Container(
              width: AppSpacing.base,
              height: AppSpacing.xs,
              decoration: BoxDecoration(
                color: isSelected && hasWorkout
                    ? AppColors.cardWhite
                    : AppColors.sportOrange,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: AppSpacing.sm,
          child: AnimatedOpacity(
            opacity: hasWorkout ? 1 : 0,
            duration: duration,
            child: Container(
              width: AppSpacing.sm,
              height: AppSpacing.sm,
              decoration: BoxDecoration(
                color: isSelected && hasWorkout
                    ? AppColors.cardWhite
                    : markerColor,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: AppTypography.labelUppercase.copyWith(color: foreground),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                date,
                style: AppTypography.statSmall.copyWith(color: foreground),
              ),
              const SizedBox(height: AppSpacing.xs),
              if (hasWorkout)
                Text(
                  status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.label.copyWith(
                    color: muted,
                    fontSize: 10,
                  ),
                )
              else
                const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ],
    );
  }
}
