import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/widgets/profile_preference_chip.dart';
import 'package:forge_ai/features/profile/widgets/profile_preference_toggle_row.dart';
import 'package:forge_ai/features/profile/widgets/profile_training_preferences_summary.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfilePreferencesCard extends StatefulWidget {
  const ProfilePreferencesCard({super.key});

  @override
  State<ProfilePreferencesCard> createState() => _ProfilePreferencesCardState();
}

class _ProfilePreferencesCardState extends State<ProfilePreferencesCard> {
  bool workoutRemindersEnabled = true;
  bool recoveryNudgesEnabled = true;
  String selectedTone = 'Balanced';
  String selectedUnit = 'Metric';

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Training Preferences', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          const ProfileTrainingPreferencesSummary(),
          const SizedBox(height: AppSpacing.lg),
          Text('App Preferences', style: AppTypography.h3),
          const SizedBox(height: AppSpacing.base),
          ProfilePreferenceToggleRow(
            icon: PhosphorIcons.bell(PhosphorIconsStyle.fill),
            title: 'Workout reminders',
            subtitle: 'Pre-lift prompts and session countdowns',
            value: workoutRemindersEnabled,
            onChanged: (value) {
              setState(() => workoutRemindersEnabled = value);
            },
          ),
          const SizedBox(height: AppSpacing.md),
          ProfilePreferenceToggleRow(
            icon: PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
            title: 'Recovery nudges',
            subtitle: 'Mobility, sleep, and readiness follow-ups',
            value: recoveryNudgesEnabled,
            onChanged: (value) {
              setState(() => recoveryNudgesEnabled = value);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('AI coaching tone', style: AppTypography.bodySemiBold),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: ['Balanced', 'Strict', 'Supportive']
                .map(
                  (tone) => ProfilePreferenceChip(
                    label: tone,
                    isSelected: selectedTone == tone,
                    onTap: () => setState(() => selectedTone = tone),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppSpacing.base),
          Text('Units', style: AppTypography.bodySemiBold),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: ['Metric', 'Imperial']
                .map(
                  (unit) => ProfilePreferenceChip(
                    label: unit,
                    isSelected: selectedUnit == unit,
                    onTap: () => setState(() => selectedUnit = unit),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
