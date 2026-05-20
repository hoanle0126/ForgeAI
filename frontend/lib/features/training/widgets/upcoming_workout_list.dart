import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/training/models/workout_session_models.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UpcomingWorkoutList extends StatelessWidget {
  const UpcomingWorkoutList({super.key, required this.currentPlan});

  final TrainingWorkoutPlan currentPlan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Up Next', style: AppTypography.h3),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          hasShadow: false,
          child: Row(
            children: [
              Container(
                width: AppSpacing.xxxl,
                height: AppSpacing.xxxl,
                decoration: BoxDecoration(
                  color: AppColors.sportOrangeLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Icon(
                  PhosphorIcons.barbell(PhosphorIconsStyle.bold),
                  color: AppColors.sportOrange,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next workout', style: AppTypography.h4),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${currentPlan.title} · ${currentPlan.estimatedDateLabel}',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(currentPlan.statusLabel, style: AppTypography.label),
            ],
          ),
        ),
      ],
    );
  }
}
