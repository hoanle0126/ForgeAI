import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TrainingLoadingState extends StatelessWidget {
  const TrainingLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppSpacing.md),
        _SkeletonBlock(height: AppSpacing.xl, width: 144),
        SizedBox(height: AppSpacing.lg),
        _TrainingHeroSkeleton(),
        SizedBox(height: AppSpacing.lg),
        _SkeletonBlock(height: 84),
        SizedBox(height: AppSpacing.lg),
        _SkeletonBlock(height: 96),
        SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}

class _TrainingHeroSkeleton extends StatelessWidget {
  const _TrainingHeroSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SkeletonBlock(
            height: AppSpacing.base,
            width: 112,
            color: AppColors.cardWhite.withValues(alpha: 0.18),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SkeletonBlock(
            height: AppSpacing.xl,
            color: AppColors.cardWhite.withValues(alpha: 0.16),
          ),
          const SizedBox(height: AppSpacing.sm),
          _SkeletonBlock(
            height: AppSpacing.base,
            width: 220,
            color: AppColors.cardWhite.withValues(alpha: 0.12),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SkeletonBlock(
            height: 56,
            color: AppColors.cardWhite.withValues(alpha: 0.14),
          ),
        ],
      ),
    );
  }
}

class _SkeletonBlock extends StatelessWidget {
  const _SkeletonBlock({
    required this.height,
    this.width,
    this.color = AppColors.inputBg,
  });

  final double height;
  final double? width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
    );
  }
}
