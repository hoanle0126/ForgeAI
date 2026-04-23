import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_tile.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileSettingsList extends StatelessWidget {
  const ProfileSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Controls', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          ProfileSettingsTile(
            icon: PhosphorIcons.user(PhosphorIconsStyle.fill),
            title: 'Athlete profile',
            subtitle: 'Body metrics, goals, equipment',
          ),
          const _SettingsDivider(),
          ProfileSettingsTile(
            icon: PhosphorIcons.slidersHorizontal(PhosphorIconsStyle.bold),
            title: 'Plan preferences',
            subtitle: 'Training days and session length',
          ),
          const _SettingsDivider(),
          ProfileSettingsTile(
            icon: PhosphorIcons.bell(PhosphorIconsStyle.fill),
            title: 'Notifications',
            subtitle: 'Workout reminders and recovery nudges',
          ),
          const _SettingsDivider(),
          ProfileSettingsTile(
            icon: PhosphorIcons.shieldCheck(PhosphorIconsStyle.fill),
            title: 'Privacy and data',
            subtitle: 'Local profile and sync controls',
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
