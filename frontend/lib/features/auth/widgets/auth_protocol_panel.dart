import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/features/auth/widgets/auth_protocol_metric.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthProtocolPanel extends StatelessWidget {
  const AuthProtocolPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                color: AppColors.energy,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'AI protocol',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              const _StatusPill(label: 'LOCAL MOCK'),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Secure your training protocol.',
            style: AppTypography.h3.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'ForgeAI keeps entry light while preparing your adaptive plan.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const AuthProtocolMetric(
            label: 'Goal fit',
            value: '92%',
            percent: 0.92,
          ),
          const SizedBox(height: AppSpacing.md),
          const AuthProtocolMetric(
            label: 'Readiness sync',
            value: 'Live',
            percent: 0.74,
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

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
        label,
        style: AppTypography.label.copyWith(
          color: AppColors.cardWhite,
          fontSize: 10,
        ),
      ),
    );
  }
}
