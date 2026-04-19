import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class EquipmentScalingPromo extends StatelessWidget {
  const EquipmentScalingPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            child: Text(
              'AI.v2',
              style: AppTypography.h1.copyWith(
                color: AppColors.sportOrange.withValues(alpha: 0.1),
                fontSize: 60,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Precision Scaling', style: AppTypography.h3),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'ForgeAI adjusts load\nrecommendations based\non your available kit.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textDisabled,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
