import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutPreviewTopBar extends StatelessWidget {
  const WorkoutPreviewTopBar({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: AppColors.cardWhite,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          child: InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Icon(
                PhosphorIcons.arrowLeft(PhosphorIconsStyle.bold),
                color: AppColors.textDark,
                size: 20,
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          'WORKOUT PREVIEW',
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.textMuted,
          ),
        ),
        const Spacer(),
        const SizedBox(width: AppSpacing.xxxl),
      ],
    );
  }
}
