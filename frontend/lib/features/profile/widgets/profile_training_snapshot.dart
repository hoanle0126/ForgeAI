import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/widgets/profile_snapshot_row.dart';
import 'package:forge_ai/features/profile/widgets/profile_status_badge.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileTrainingSnapshot extends ConsumerWidget {
  const ProfileTrainingSnapshot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(selectedWorkoutGoalProvider);
    final trainingDays = ref.watch(selectedDaysProvider);
    final preferredTime = ref.watch(preferredTimeProvider);
    final weeklyCapacity = trainingDays.isEmpty
        ? 0.0
        : (trainingDays.length / TrainingDay.values.length).clamp(0.0, 1.0);

    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Training Snapshot', style: AppTypography.h3),
              ),
              const ProfileStatusBadge(),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            'Weekly capacity',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.textDark,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            child: LinearProgressIndicator(
              minHeight: AppSpacing.sm,
              value: weeklyCapacity,
              backgroundColor: AppColors.inputBg,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.sportOrange,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          ProfileSnapshotRow(
            icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
            title: 'Primary goal',
            value: goal?.title ?? 'Not set',
            color: AppColors.sportOrange,
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSnapshotRow(
            icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
            title: 'Training split',
            value: trainingDays.isEmpty
                ? 'Not set'
                : '${trainingDays.length} days / week',
            color: AppColors.energy,
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSnapshotRow(
            icon: PhosphorIcons.clock(PhosphorIconsStyle.fill),
            title: 'Preferred time',
            value: preferredTime?.label ?? 'Not set',
            color: AppColors.aiBlue,
          ),
        ],
      ),
    );
  }
}
