import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WelcomeHeroContent extends StatelessWidget {
  const WelcomeHeroContent({super.key, required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.sportOrangeLight,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Text(
            'AI-POWERED TRAINING',
            style: AppTypography.label.copyWith(
              color: AppColors.sportOrange,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Your Personal\nCoach Lives\nHere',
          style: AppTypography.h1.copyWith(
            fontSize: isWide ? 64 : 48,
            height: 1.1,
            letterSpacing: -2,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Smart workout plans and nutrition guidance tailored to your goals, equipment, and schedule.',
          style: AppTypography.bodyLarge.copyWith(
            fontSize: 18,
            height: 1.6,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
