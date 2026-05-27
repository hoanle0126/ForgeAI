import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WeeklyDayIndicator extends StatelessWidget {
  const WeeklyDayIndicator({
    super.key,
    required this.day,
    this.isDone = false,
    this.isToday = false,
  });

  final String day;
  final bool isDone;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: AppTypography.labelUppercase.copyWith(
            color: isToday || isDone
                ? AppColors.textDark
                : AppColors.textDisabled,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone
                ? AppColors.success
                : isToday
                ? AppColors.cardWhite
                : AppColors.border,
            border: isToday
                ? Border.all(color: AppColors.sportOrange, width: 3)
                : null,
          ),
          child: isDone
              ? const Icon(Icons.check, color: AppColors.cardWhite, size: 16)
              : isToday
              ? const Center(child: _TodayDot())
              : null,
        ),
      ],
    );
  }
}

class _TodayDot extends StatelessWidget {
  const _TodayDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.sm,
      height: AppSpacing.sm,
      decoration: const BoxDecoration(
        color: AppColors.sportOrange,
        shape: BoxShape.circle,
      ),
    );
  }
}
