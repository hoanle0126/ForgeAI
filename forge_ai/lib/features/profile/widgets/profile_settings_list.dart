import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_tile.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileSettingsList extends StatelessWidget {
  const ProfileSettingsList({
    super.key,
    required this.onTrainingPreferences,
    required this.onNotifications,
    required this.onLogOut,
  });

  final VoidCallback onTrainingPreferences;
  final VoidCallback onNotifications;
  final VoidCallback onLogOut;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Controls', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          ProfileSettingsTile(
            icon: PhosphorIcons.slidersHorizontal(PhosphorIconsStyle.bold),
            title: 'Training preferences',
            subtitle: 'Goals, equipment, and schedule',
            onTap: onTrainingPreferences,
          ),
          const _SettingsDivider(),
          ProfileSettingsTile(
            icon: PhosphorIcons.bell(PhosphorIconsStyle.fill),
            title: 'Notifications',
            subtitle: 'Workout reminders and recovery nudges',
            onTap: onNotifications,
          ),
          const _SettingsDivider(),
          ProfileSettingsTile(
            icon: PhosphorIcons.signOut(PhosphorIconsStyle.bold),
            title: 'Log out',
            subtitle: 'Return to the sign-in screen',
            onTap: onLogOut,
          ),
        ],
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  const _SettingsDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: AppSpacing.base,
      color: AppColors.border,
      thickness: 1,
    );
  }
}
