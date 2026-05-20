import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/widgets/training_more_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingHeader extends StatelessWidget {
  const TrainingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Training', style: AppTypography.h1),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Your adaptive plan for the week',
              style: AppTypography.bodyMedium,
            ),
          ],
        ),
        Semantics(
          button: true,
          label: 'Open more menu',
          child: Material(
            color: AppColors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () {
                TrainingMoreSheet.show(context);
              },
              customBorder: const CircleBorder(),
              child: Ink(
                width: AppSpacing.xxxl,
                height: AppSpacing.xxxl,
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border),
                ),
                child: Icon(
                  PhosphorIcons.dotsThree(PhosphorIconsStyle.bold),
                  color: AppColors.textDark,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
