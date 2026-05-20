import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/widgets/profile_snapshot_row.dart';
import 'package:forge_ai/features/profile/widgets/profile_status_badge.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileTrainingSnapshot extends StatelessWidget {
  const ProfileTrainingSnapshot({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const LinearProgressIndicator(
              minHeight: AppSpacing.sm,
              value: 0.74,
              backgroundColor: AppColors.inputBg,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.sportOrange),
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          ProfileSnapshotRow(
            icon: PhosphorIcons.barbell(PhosphorIconsStyle.fill),
            title: 'Primary goal',
            value: 'Lean strength',
            color: AppColors.sportOrange,
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSnapshotRow(
            icon: PhosphorIcons.lightning(PhosphorIconsStyle.fill),
            title: 'Training split',
            value: '4 days / week',
            color: AppColors.energy,
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileSnapshotRow(
            icon: PhosphorIcons.shieldCheck(PhosphorIconsStyle.fill),
            title: 'Recovery bias',
            value: 'Moderate',
            color: AppColors.recovery,
          ),
        ],
      ),
    );
  }
}
