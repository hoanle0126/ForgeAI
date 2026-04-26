import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountCoachIllustration extends StatelessWidget {
  const AccountCoachIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.xxxl,
      height: AppSpacing.xxxl,
      decoration: BoxDecoration(
        color: AppColors.cardWhite.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            PhosphorIcons.barbell(PhosphorIconsStyle.bold),
            color: AppColors.cardWhite.withValues(alpha: 0.82),
            size: 28,
          ),
          Positioned(
            right: AppSpacing.sm,
            top: AppSpacing.sm,
            child: Icon(
              PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
              color: AppColors.energy,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
