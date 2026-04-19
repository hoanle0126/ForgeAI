import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HeroWorkoutCardActions extends StatelessWidget {
  const HeroWorkoutCardActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: 'Start Workout',
            icon: PhosphorIcons.play(PhosphorIconsStyle.fill),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          child: Ink(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(
              PhosphorIcons.slidersHorizontal(PhosphorIconsStyle.bold),
              color: AppColors.textDark,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
