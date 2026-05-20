import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NutritionProtocolCard extends StatelessWidget {
  const NutritionProtocolCard({super.key});

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
              Icon(
                PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                color: AppColors.energy,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'FUEL PROTOCOL',
                style: AppTypography.labelUppercase.copyWith(
                  color: AppColors.cardWhite.withValues(alpha: 0.72),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            'High-protein performance day',
            style: AppTypography.h2.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Keep carbs near the workout window and use a lighter dinner to protect recovery.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
              height: 1.45,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Row(
            children: [
              _ProtocolMetric(label: 'KCAL', value: '1.8K'),
              SizedBox(width: AppSpacing.sm),
              _ProtocolMetric(label: 'PROTEIN', value: '140G'),
              SizedBox(width: AppSpacing.sm),
              _ProtocolMetric(label: 'WINDOW', value: '2H'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProtocolMetric extends StatelessWidget {
  const _ProtocolMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cardWhite.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Text(
                value,
                style: AppTypography.statSmall.copyWith(
                  color: AppColors.cardWhite,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(label, style: AppTypography.labelUppercase),
            ],
          ),
        ),
      ),
    );
  }
}
