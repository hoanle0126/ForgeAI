import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileSettingsAccountCard extends StatelessWidget {
  const ProfileSettingsAccountCard({super.key, required this.displayName});

  final String displayName;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSpacing.xxxl,
                height: AppSpacing.xxxl,
                decoration: BoxDecoration(
                  color: AppColors.sportOrangeLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                ),
                child: Icon(
                  PhosphorIcons.userCircle(PhosphorIconsStyle.fill),
                  color: AppColors.sportOrange,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(displayName, style: AppTypography.h4),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Hybrid strength athlete',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Text(
              'AI TRAINING PROFILE',
              style: AppTypography.labelUppercase.copyWith(
                color: AppColors.textDark,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Keep your profile current so ForgeAI can tune workouts, reminders, and recovery guidance.',
            style: AppTypography.bodyMedium,
          ),
        ],
      ),
    );
  }
}
