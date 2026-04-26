import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_sheet_action_row.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountSheetActionList extends StatelessWidget {
  const AccountSheetActionList({
    super.key,
    required this.onViewFullProfile,
    required this.onTrainingPreferences,
    required this.onNotifications,
  });

  final VoidCallback onViewFullProfile;
  final VoidCallback onTrainingPreferences;
  final VoidCallback onNotifications;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      hasShadow: false,
      child: Column(
        children: [
          AccountSheetActionRow(
            icon: PhosphorIcons.user(PhosphorIconsStyle.fill),
            title: 'View full profile',
            subtitle: 'Open your athlete dashboard',
            onTap: onViewFullProfile,
          ),
          const Divider(height: 1, color: AppColors.border),
          AccountSheetActionRow(
            icon: PhosphorIcons.slidersHorizontal(PhosphorIconsStyle.bold),
            title: 'Training preferences',
            subtitle: 'Goals, equipment, and schedule',
            onTap: onTrainingPreferences,
          ),
          const Divider(height: 1, color: AppColors.border),
          AccountSheetActionRow(
            icon: PhosphorIcons.bell(PhosphorIconsStyle.fill),
            title: 'Notifications',
            subtitle: 'Workout reminders and recovery nudges',
            onTap: onNotifications,
          ),
        ],
      ),
    );
  }
}
