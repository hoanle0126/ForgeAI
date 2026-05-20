import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WorkoutStat extends StatelessWidget {
  const WorkoutStat({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.sportOrange, size: 18),
        const SizedBox(width: AppSpacing.xs),
        Text(
          label,
          style: AppTypography.bodySemiBold.copyWith(
            color: AppColors.cardWhite,
          ),
        ),
      ],
    );
  }
}
