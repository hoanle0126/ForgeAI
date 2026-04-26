import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/dashboard/widgets/home/account_coach_illustration.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountCoachCard extends StatelessWidget {
  const AccountCoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _CoachIconWell(),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'FORGEAI COACH',
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.cardWhite.withValues(alpha: 0.68),
                  ),
                ),
              ),
              const _ReadinessPill(),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upper strength is your best move today.',
                      style: AppTypography.h4.copyWith(
                        color: AppColors.cardWhite,
                      ),
                    ),
                    Text(
                      'Keep hinge work light and finish with mobility.',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.cardWhite.withValues(alpha: 0.72),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              const AccountCoachIllustration(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CoachIconWell extends StatelessWidget {
  const _CoachIconWell();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.sportOrange.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Icon(
        PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
        color: AppColors.energy,
        size: 18,
      ),
    );
  }
}

class _ReadinessPill extends StatelessWidget {
  const _ReadinessPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardWhite.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Text(
        '86 READY',
        style: AppTypography.statSmall.copyWith(
          color: AppColors.cardWhite,
          fontSize: 12,
        ),
      ),
    );
  }
}
