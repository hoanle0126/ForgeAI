import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class NotificationCommandCard extends StatelessWidget {
  const NotificationCommandCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Action queue',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite.withValues(alpha: 0.72),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.sportOrange,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  '2 unread',
                  style: AppTypography.label.copyWith(
                    color: AppColors.cardWhite,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            'Prioritize what changes today\'s training.',
            style: AppTypography.h3.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Workout timing, recovery shifts, and AI plan updates stay grouped before older history.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
            ),
          ),
          const SizedBox(height: AppSpacing.base),
          const Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _NotificationTonePill(
                label: 'Workout',
                color: AppColors.sportOrange,
              ),
              _NotificationTonePill(
                label: 'Recovery',
                color: AppColors.recovery,
              ),
              _NotificationTonePill(
                label: 'AI insight',
                color: AppColors.aiBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotificationTonePill extends StatelessWidget {
  const _NotificationTonePill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(color: color.withValues(alpha: 0.32)),
      ),
      child: Text(
        label,
        style: AppTypography.label.copyWith(color: AppColors.cardWhite),
      ),
    );
  }
}
