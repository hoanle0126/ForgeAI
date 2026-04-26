import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_coach_card.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_metric_tile.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_profile_hero.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_sheet_action_list.dart';

class AccountQuickSheet extends StatelessWidget {
  const AccountQuickSheet({
    super.key,
    required this.displayName,
    required this.onViewFullProfile,
    required this.onTrainingPreferences,
    required this.onNotifications,
  });

  final String displayName;
  final VoidCallback onViewFullProfile;
  final VoidCallback onTrainingPreferences;
  final VoidCallback onNotifications;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.base,
          AppSpacing.md,
          AppSpacing.base,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _SheetHandle(),
            const SizedBox(height: AppSpacing.base),
            AccountProfileHero(displayName: displayName),
            const SizedBox(height: AppSpacing.base),
            const _MetricRow(),
            const SizedBox(height: AppSpacing.base),
            const AccountCoachCard(),
            const SizedBox(height: AppSpacing.base),
            AccountSheetActionList(
              onViewFullProfile: onViewFullProfile,
              onTrainingPreferences: onTrainingPreferences,
              onNotifications: onNotifications,
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppSpacing.xxxl,
        height: AppSpacing.xs,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AccountMetricTile(
          label: 'STREAK',
          value: '12',
          backgroundColor: AppColors.sportOrangeLight,
          labelColor: AppColors.sportOrange,
        ),
        SizedBox(width: AppSpacing.sm),
        AccountMetricTile(
          label: 'READY',
          value: '86',
          backgroundColor: AppColors.inputBg,
        ),
        SizedBox(width: AppSpacing.sm),
        AccountMetricTile(
          label: 'LOAD',
          value: '7.4',
          backgroundColor: AppColors.recoveryLight,
          labelColor: AppColors.recovery,
        ),
      ],
    );
  }
}
