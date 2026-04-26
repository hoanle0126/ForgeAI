import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

const double _avatarSize = 112;
const double _avatarShadowBlur = 28;
const Offset _avatarShadowOffset = Offset(0, 14);

class AccountProfileHero extends StatelessWidget {
  const AccountProfileHero({super.key, required this.displayName});

  final String displayName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          label: '$displayName profile avatar',
          image: true,
          child: Container(
            width: _avatarSize,
            height: _avatarSize,
            padding: const EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.sportOrangeLight,
              boxShadow: [
                BoxShadow(
                  color: AppColors.sportOrange.withValues(alpha: 0.18),
                  blurRadius: _avatarShadowBlur,
                  offset: _avatarShadowOffset,
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              backgroundColor: AppColors.border,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'ATHLETE PROFILE',
          style: AppTypography.labelUppercase.copyWith(
            color: AppColors.sportOrange,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(displayName, textAlign: TextAlign.center, style: AppTypography.h3),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '12-day streak · Readiness 86',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium,
        ),
      ],
    );
  }
}
