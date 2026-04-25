import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class PerformanceSnapshotCard extends StatelessWidget {
  const PerformanceSnapshotCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.base,
        AppSpacing.base,
        AppSpacing.base,
        AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Snapshot',
            style: AppTypography.h4.copyWith(fontSize: 16),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'A quick read on the output supporting today\'s lighter plan.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textMuted,
              height: 1.35,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const Row(
            children: [
              Expanded(
                child: _SnapshotMetric(
                  label: 'Volume',
                  value: '12.4k',
                  unit: 'lbs lifted',
                ),
              ),
              SizedBox(width: AppSpacing.base),
              Expanded(
                child: _SnapshotMetric(
                  label: 'Streak',
                  value: '12',
                  unit: 'days active',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SnapshotMetric extends StatelessWidget {
  const _SnapshotMetric({
    required this.label,
    required this.value,
    required this.unit,
  });

  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.labelUppercase),
        const SizedBox(height: AppSpacing.xs),
        Text(value, style: AppTypography.statMedium),
        const SizedBox(height: AppSpacing.xs),
        Text(
          unit,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textDisabled,
          ),
        ),
      ],
    );
  }
}
