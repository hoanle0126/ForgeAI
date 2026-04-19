import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HeroWorkoutExerciseCount extends StatelessWidget {
  const HeroWorkoutExerciseCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          PhosphorIcons.barbell(PhosphorIconsStyle.fill),
          color: AppColors.cardWhite,
          size: 16,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          '6 exercises sequenced',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.cardWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
