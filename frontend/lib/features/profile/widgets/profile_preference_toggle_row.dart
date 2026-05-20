import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class ProfilePreferenceToggleRow extends StatelessWidget {
  const ProfilePreferenceToggleRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textDark, size: 18),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodySemiBold),
                const SizedBox(height: AppSpacing.xs),
                Text(subtitle, style: AppTypography.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Switch.adaptive(
            value: value,
            activeTrackColor: AppColors.sportOrange,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
