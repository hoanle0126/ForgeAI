import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkoutLibraryEntryCard extends StatelessWidget {
  const WorkoutLibraryEntryCard({
    super.key,
    required this.onOpenLibrary,
    required this.onCreateWorkout,
  });

  final VoidCallback onOpenLibrary;
  final VoidCallback onCreateWorkout;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSpacing.xxxl,
                height: AppSpacing.xxxl,
                decoration: BoxDecoration(
                  color: AppColors.sportOrangeLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Icon(
                  PhosphorIcons.books(PhosphorIconsStyle.bold),
                  color: AppColors.sportOrange,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Workout Library', style: AppTypography.h4),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Review saved plans before you start or build another one.',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'View Library',
                  variant: AppButtonVariant.secondary,
                  onPressed: onOpenLibrary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: AppButton(
                  text: 'Create',
                  icon: PhosphorIcons.plus(PhosphorIconsStyle.bold),
                  onPressed: onCreateWorkout,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
