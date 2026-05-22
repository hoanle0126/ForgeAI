import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MonthlyPlanErrorState extends StatelessWidget {
  const MonthlyPlanErrorState({
    super.key,
    required this.description,
    required this.onRetry,
  });

  final String description;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.energy,
            size: AppSpacing.xl,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'We could not build your month 1 block',
            style: AppTypography.h3.copyWith(color: AppColors.cardWhite),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.74),
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(text: 'Try Again', icon: Icons.refresh, onPressed: onRetry),
        ],
      ),
    );
  }
}
