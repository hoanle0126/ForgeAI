import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class AccountCoachCard extends StatelessWidget {
  const AccountCoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.textDark,
      hasShadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FORGEAI COACH',
            style: AppTypography.labelUppercase.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.68),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Today favors upper strength with lighter hinge load.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.cardWhite.withValues(alpha: 0.78),
            ),
          ),
        ],
      ),
    );
  }
}
