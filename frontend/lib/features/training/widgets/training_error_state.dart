import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_button.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingErrorState extends StatelessWidget {
  const TrainingErrorState({
    super.key,
    required this.onRetry,
    this.title = 'We could not load your plan',
    this.description =
        'Check your connection and try again. ForgeAI will sync your latest workouts as soon as the link is back.',
  });

  final VoidCallback onRetry;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ErrorStateSignal(),
          const SizedBox(height: AppSpacing.xl),
          Text(
            title,
            style: AppTypography.h1.copyWith(color: AppColors.cardWhite),
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
          AppButton(
            text: 'Try again',
            icon: PhosphorIcons.arrowsClockwise(PhosphorIconsStyle.bold),
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}

class _ErrorStateSignal extends StatelessWidget {
  const _ErrorStateSignal();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.xxxl,
      height: AppSpacing.xxxl,
      decoration: BoxDecoration(
        color: AppColors.cardWhite.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.cardWhite.withValues(alpha: 0.16)),
      ),
      child: Icon(
        PhosphorIcons.warningCircle(PhosphorIconsStyle.fill),
        color: AppColors.energy,
        size: 24,
      ),
    );
  }
}
