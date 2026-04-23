import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/profile/widgets/profile_signal_pill.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfilePerformanceCard extends StatelessWidget {
  const ProfilePerformanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        image: const DecorationImage(
          image: AssetImage('assets/images/dark_gym.png'),
          fit: BoxFit.cover,
          opacity: 0.28,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.10),
            blurRadius: AppSpacing.lg,
            offset: const Offset(0, AppSpacing.sm),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  'PROFILE SYNC',
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.cardWhite,
                    fontSize: 11,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                color: AppColors.energy,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Training profile calibrated',
            style: AppTypography.h2.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'ForgeAI is balancing strength volume with recovery signals from the last 14 days.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.76),
              height: 1.45,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Row(
            children: [
              ProfileSignalPill(label: 'READINESS', value: '86'),
              SizedBox(width: AppSpacing.sm),
              ProfileSignalPill(label: 'LOAD', value: '7.4'),
            ],
          ),
        ],
      ),
    );
  }
}
