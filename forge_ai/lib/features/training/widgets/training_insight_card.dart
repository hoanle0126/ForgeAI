import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingInsightCard extends StatelessWidget {
  const TrainingInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.recoveryLight,
      hasShadow: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
            color: AppColors.recovery,
            size: 22,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ForgeAI Recovery', style: AppTypography.h4),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Readiness is steady, so today keeps strength work focused while limiting extra volume.',
                  style: AppTypography.bodyMedium.copyWith(height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
