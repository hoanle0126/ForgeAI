import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/models/profile_summary.dart';
import 'package:forge_ai/features/profile/widgets/profile_snapshot_row.dart';
import 'package:forge_ai/features/profile/widgets/profile_status_badge.dart';
import 'package:forge_ai/features/workout_builder/providers/workout_builder_provider.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileTrainingSnapshot extends ConsumerWidget {
  const ProfileTrainingSnapshot({super.key, this.profile});

  final ProfileSummary? profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(selectedWorkoutGoalProvider);
    final trainingDays = ref.watch(selectedDaysProvider);
    final preferredTime = ref.watch(preferredTimeProvider);
    final profileDays = profile?.trainingSnapshot.preferredDays ?? const [];
    final effectiveDayCount = trainingDays.isNotEmpty
        ? trainingDays.length
        : profileDays.length;
    final weeklyCapacity = effectiveDayCount == 0
        ? 0.0
        : (effectiveDayCount / TrainingDay.values.length).clamp(0.0, 1.0);

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
            value:
                goal?.title ??
                _goalLabel(profile?.trainingSnapshot.primaryGoal),
            color: AppColors.sportOrange,
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSnapshotRow(
            icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
            title: 'Training split',
            value: effectiveDayCount == 0
                ? 'Not set'
                : '$effectiveDayCount days / week',
            color: AppColors.energy,
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSnapshotRow(
            icon: PhosphorIcons.clock(PhosphorIconsStyle.fill),
            title: 'Preferred time',
            value:
                preferredTime?.label ??
                _durationLabel(
                  profile?.trainingSnapshot.preferredDurationMinutes,
                ),
            color: AppColors.aiBlue,
          ),
        ],
      ),
    );
  }
}

String _goalLabel(String? goal) {
  return switch (goal) {
    'strength' => 'Strength',
    'muscle_gain' => 'Muscle Gain',
    'fat_loss' => 'Fat Loss',
    'mobility' => 'Mobility',
    'general_fitness' => 'General Fitness',
    _ => 'Not set',
  };
}

String _durationLabel(int? durationMinutes) {
  if (durationMinutes == null) {
    return 'Not set';
  }
  return '$durationMinutes min sessions';
}
