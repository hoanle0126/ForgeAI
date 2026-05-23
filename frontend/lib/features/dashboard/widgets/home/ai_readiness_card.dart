import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AiReadinessCard extends StatelessWidget {
  const AiReadinessCard({
    super.key,
    this.readinessScore = 72,
    this.readinessMessage =
        'Slept 6h — today\'s session is dynamically lightened for optimal recovery.',
  });

  final int readinessScore;
  final String readinessMessage;

  @override
  Widget build(BuildContext context) {
    final clampedScore = readinessScore.clamp(0, 100).toInt();

    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularPercentIndicator(
            radius: AppSpacing.xl,
            lineWidth: 5,
            percent: clampedScore / 100,
            center: Text(
              clampedScore.toString(),
              style: AppTypography.statSmall.copyWith(fontSize: 14),
            ),
            progressColor: AppColors.success,
            backgroundColor: AppColors.inputBg,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                      color: AppColors.aiBlue,
                      size: 16,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'ForgeAI Insight',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  readinessMessage,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textDisabled,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
