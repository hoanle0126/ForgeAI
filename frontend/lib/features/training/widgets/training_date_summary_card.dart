import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrainingDateSummaryCard extends StatelessWidget {
  const TrainingDateSummaryCard({
    super.key,
    required this.dateLabel,
    required this.status,
  });

  final String dateLabel;
  final String status;

  @override
  Widget build(BuildContext context) {
    final isRest = status == 'Rest';

    return AppCard(
      hasShadow: false,
      color: isRest ? AppColors.recoveryLight : AppColors.cardWhite,
      child: Row(
        children: [
          Container(
            width: AppSpacing.xxxl,
            height: AppSpacing.xxxl,
            decoration: BoxDecoration(
              color: isRest ? AppColors.cardWhite : AppColors.sportOrangeLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: Icon(
              isRest
                  ? PhosphorIcons.moonStars(PhosphorIconsStyle.fill)
                  : PhosphorIcons.barbell(PhosphorIconsStyle.bold),
              color: isRest ? AppColors.recovery : AppColors.sportOrange,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateLabel, style: AppTypography.h4),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  isRest
                      ? 'Recovery-aware volume with mobility work.'
                      : '$status protocol with readiness sync.',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
