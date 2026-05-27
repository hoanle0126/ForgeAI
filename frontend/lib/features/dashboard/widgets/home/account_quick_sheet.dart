import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_coach_card.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_metric_row.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_profile_hero.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_sheet_action_list.dart';

class AccountQuickSheet extends StatelessWidget {
  const AccountQuickSheet({
    super.key,
    required this.displayName,
    required this.streakValue,
    required this.readinessValue,
    required this.loadValue,
    required this.onViewFullProfile,
    required this.onTrainingPreferences,
    required this.onNotifications,
    required this.onLogOut,
  });

  final String displayName;
  final String streakValue;
  final String readinessValue;
  final String loadValue;
  final VoidCallback onViewFullProfile;
  final VoidCallback onTrainingPreferences;
  final VoidCallback onNotifications;
  final VoidCallback onLogOut;

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
            AccountMetricRow(
              streakValue: streakValue,
              readinessValue: readinessValue,
              loadValue: loadValue,
            ),
            const SizedBox(height: AppSpacing.base),
            const AccountCoachCard(),
            const SizedBox(height: AppSpacing.base),
            AccountSheetActionList(
              onViewFullProfile: onViewFullProfile,
              onTrainingPreferences: onTrainingPreferences,
              onNotifications: onNotifications,
              onLogOut: onLogOut,
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
