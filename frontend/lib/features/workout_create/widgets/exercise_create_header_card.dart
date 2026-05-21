import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExerciseCreateHeaderCard extends StatelessWidget {
  const ExerciseCreateHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      borderRadius: AppSpacing.radiusXl,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: AppSpacing.xxxl,
                height: AppSpacing.xxxl,
                decoration: BoxDecoration(
                  color: AppColors.cardWhite.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  border: Border.all(
                    color: AppColors.cardWhite.withValues(alpha: 0.12),
                  ),
                ),
                child: Center(
                  child: PhosphorIcon(
                    PhosphorIcons.barbell(),
                    color: AppColors.cardWhite,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  'CUSTOM MOVEMENT',
                  style: AppTypography.labelUppercase.copyWith(
                    color: AppColors.cardWhite.withValues(alpha: 0.68),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Add one clear exercise for your own training library.',
            style: AppTypography.h2.copyWith(
              color: AppColors.cardWhite,
              height: 1.12,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Pick muscle groups, equipment, and cues so the workout builder can reuse it without guessing.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.72),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
