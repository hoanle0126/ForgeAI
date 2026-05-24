import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.displayName,
    required this.athleteTitle,
    required this.onSettingsTap,
  });

  final String displayName;
  final String athleteTitle;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: AppSpacing.xl,
              backgroundImage: AssetImage('assets/images/avatar.png'),
              backgroundColor: AppColors.border,
            ),
            Positioned(
              right: -AppSpacing.xs,
              bottom: AppSpacing.xs,
              child: Container(
                width: AppSpacing.base,
                height: AppSpacing.base,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.warmIvory,
                    width: AppSpacing.xs,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: AppSpacing.base),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.h1,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                athleteTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Semantics(
          button: true,
          label: 'Open profile settings',
          child: Material(
            color: AppColors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onSettingsTap,
              customBorder: const CircleBorder(),
              child: Ink(
                width: AppSpacing.xxxl,
                height: AppSpacing.xxxl,
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border),
                ),
                child: Icon(
                  PhosphorIcons.slidersHorizontal(PhosphorIconsStyle.bold),
                  color: AppColors.textDark,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
