import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class TrainingDateChip extends StatelessWidget {
  const TrainingDateChip({
    super.key,
    required this.weekdayLabel,
    required this.dayLabel,
    required this.statusLabel,
    required this.isSelected,
    required this.isToday,
    required this.onTap,
  });

  final String weekdayLabel;
  final String dayLabel;
  final String statusLabel;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final background = isSelected ? AppColors.sportOrange : AppColors.cardWhite;
    final borderColor = isToday ? AppColors.sportOrange : AppColors.border;
    final primaryColor = isSelected ? AppColors.cardWhite : AppColors.textDark;
    final secondaryColor = isSelected
        ? AppColors.cardWhite
        : AppColors.textDisabled;

    return Semantics(
      button: true,
      selected: isSelected,
      label: '$weekdayLabel $dayLabel, $statusLabel',
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeInOut,
            height: 84,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: isSelected ? AppColors.sportOrange : borderColor,
                width: isToday || isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weekdayLabel,
                  style: AppTypography.labelUppercase.copyWith(
                    color: secondaryColor,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  dayLabel,
                  style: AppTypography.statMedium.copyWith(color: primaryColor),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  statusLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.label.copyWith(
                    color: secondaryColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
