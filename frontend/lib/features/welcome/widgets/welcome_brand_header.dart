import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WelcomeBrandHeader extends StatelessWidget {
  const WelcomeBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSpacing.xxxl,
          height: AppSpacing.xxxl,
          decoration: BoxDecoration(
            color: AppColors.sportOrange,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: const Icon(
            PhosphorIconsBold.lightning,
            color: AppColors.cardWhite,
            size: 28,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          'ForgeAI',
          style: AppTypography.h2.copyWith(fontSize: 28, letterSpacing: -0.5),
        ),
      ],
    );
  }
}
