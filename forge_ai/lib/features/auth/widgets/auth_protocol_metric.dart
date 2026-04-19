import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AuthProtocolMetric extends StatelessWidget {
  const AuthProtocolMetric({
    super.key,
    required this.label,
    required this.value,
    required this.percent,
  });

  final String label;
  final String value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.cardWhite.withValues(alpha: 0.7),
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: AppTypography.statSmall.copyWith(
                color: AppColors.cardWhite,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 7,
          percent: percent,
          barRadius: const Radius.circular(AppSpacing.radiusFull),
          backgroundColor: AppColors.cardWhite.withValues(alpha: 0.12),
          progressColor: AppColors.sportOrange,
        ),
      ],
    );
  }
}
