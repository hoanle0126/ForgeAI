import 'package:flutter/material.dart';

import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/core/constants/app_typography.dart';

class WelcomeHeroCopy extends StatelessWidget {
  const WelcomeHeroCopy({
    super.key,
    required this.isWide,
    required this.isCompactHeight,
  });

  final bool isWide;
  final bool isCompactHeight;

  @override
  Widget build(BuildContext context) {
    final headingText = isWide
        ? 'Your Personal Coach\nLives Here'
        : 'Your Coach\nLives Here';
    final headingSize = isWide
        ? (isCompactHeight ? 56.0 : 64.0)
        : (isCompactHeight ? 36.0 : 44.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
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
        SizedBox(height: isCompactHeight ? AppSpacing.md : AppSpacing.lg),
        Text(
          headingText,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.h1.copyWith(
            fontSize: headingSize,
            height: 1.1,
            letterSpacing: -2,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: isCompactHeight ? AppSpacing.md : AppSpacing.lg),
        Text(
          'Adaptive workouts and recovery guidance built around your goals and schedule.',
          maxLines: isCompactHeight ? 2 : 3,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.bodyLarge.copyWith(
            fontSize: isCompactHeight ? 16 : 18,
            height: 1.6,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
