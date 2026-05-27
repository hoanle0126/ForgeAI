import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/auth/providers/auth_provider.dart';
import 'package:forge_ai/features/profile/providers/profile_provider.dart';
import 'package:forge_ai/features/profile/widgets/profile_preferences_card.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_account_card.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_form.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_header.dart';
import 'package:forge_ai/features/profile/widgets/profile_settings_list.dart';

class ProfileSettingsScreen extends ConsumerWidget {
  const ProfileSettingsScreen({
    super.key,
    required this.onTrainingPreferences,
    required this.onNotifications,
    required this.onLogOut,
  });

  final VoidCallback onTrainingPreferences;
  final VoidCallback onNotifications;
  final VoidCallback onLogOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).valueOrNull;
    final displayName =
        profile?.fullName ??
        ref.watch(authProvider).displayName ??
        'Alex Morgan';

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              ProfileSettingsHeader(onBack: () => Navigator.of(context).pop()),
              const SizedBox(height: AppSpacing.lg),
              ProfileSettingsAccountCard(
                displayName: displayName,
                athleteTitle:
                    profile?.athleteTitle ?? 'Hybrid strength athlete',
                email: profile?.email ?? 'athlete@forge.ai',
              ),
              const SizedBox(height: AppSpacing.base),
              ProfileSettingsForm(profile: profile),
              const SizedBox(height: AppSpacing.base),
              const ProfilePreferencesCard(),
              const SizedBox(height: AppSpacing.base),
              ProfileSettingsList(
                onTrainingPreferences: onTrainingPreferences,
                onNotifications: onNotifications,
                onLogOut: onLogOut,
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
