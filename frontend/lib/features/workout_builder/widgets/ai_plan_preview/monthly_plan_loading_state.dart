import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class MonthlyPlanLoadingState extends StatelessWidget {
  const MonthlyPlanLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          color: AppColors.textDark,
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              const SizedBox(
                width: AppSpacing.xl,
                height: AppSpacing.xl,
                child: CircularProgressIndicator(
                  strokeWidth: 2.6,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.sportOrange,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.base),
              Expanded(
                child: Text(
                  'ForgeAI is mapping your 4-week block and locking in the four weekly templates.',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.cardWhite,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const _SkeletonCard(height: 160),
        const SizedBox(height: AppSpacing.md),
        const _SkeletonCard(height: 136),
        const SizedBox(height: AppSpacing.md),
        const _SkeletonCard(height: 112),
      ],
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
    );
  }
}
