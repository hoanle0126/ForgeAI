import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class TrainingStatisticsLoadingState extends StatelessWidget {
  const TrainingStatisticsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StatisticsSkeletonBlock(height: 208, color: AppColors.textDark),
        SizedBox(height: AppSpacing.lg),
        _StatisticsSkeletonGrid(),
        SizedBox(height: AppSpacing.lg),
        _StatisticsSkeletonBlock(height: 264),
        SizedBox(height: AppSpacing.lg),
        _StatisticsSkeletonBlock(height: 188),
        SizedBox(height: AppSpacing.lg),
        _StatisticsSkeletonBlock(height: 188),
        SizedBox(height: AppSpacing.lg),
        _StatisticsSkeletonBlock(height: 180),
      ],
    );
  }
}

class _StatisticsSkeletonGrid extends StatelessWidget {
  const _StatisticsSkeletonGrid();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: _StatisticsSkeletonBlock(height: 112)),
            SizedBox(width: AppSpacing.base),
            Expanded(child: _StatisticsSkeletonBlock(height: 112)),
          ],
        ),
        SizedBox(height: AppSpacing.base),
        Row(
          children: [
            Expanded(child: _StatisticsSkeletonBlock(height: 112)),
            SizedBox(width: AppSpacing.base),
            Expanded(child: _StatisticsSkeletonBlock(height: 112)),
          ],
        ),
      ],
    );
  }
}

class _StatisticsSkeletonBlock extends StatelessWidget {
  const _StatisticsSkeletonBlock({required this.height, this.color});

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: color ?? AppColors.inputBg,
      hasShadow: false,
      child: SizedBox(height: height),
    );
  }
}
